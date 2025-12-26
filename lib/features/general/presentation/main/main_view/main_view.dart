import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_boilerplate/app/app.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/di.dart';
import 'package:my_boilerplate/features/general/general.dart';
import 'package:my_boilerplate/l10n/l10n.dart';

part 'main_view.component.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final AppCubit appCubit = di<AppCubit>();
  final MainCubit mainCubit = di<MainCubit>();
  final AppNavigator appNavigator = di<AppNavigator>();

  void showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(create: (context) => appCubit),
        BlocProvider<MainCubit>(create: (context) => mainCubit),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AppCubit, AppState>(
            listener: (context, state) {
              state.whenOrNull(
                unauthenticated: () => di<AppNavigator>().goToSplash(context),
                error: (error) {
                  if (appNavigator.canPop(context)) {
                    appNavigator.back(context);
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(error)),
                  );
                },
                loading: () => showLoading(context),
              );
            },
          ),
        ],
        child: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            return Scaffold(
              body: IndexedStack(
                index: state.currentIndex,
                children: MainState.allTabs
                    .map((tab) => state.pages[tab] ?? const SizedBox.shrink())
                    .toList(),
              ),
              bottomNavigationBar: NavigationBar(
                onDestinationSelected: (index) =>
                    context.read<MainCubit>().changeTabByIndex(index),
                selectedIndex: state.currentIndex,
                destinations: MainState.allTabs.map((tab) {
                  return NavigationDestination(
                    icon: Icon(tab.icon),
                    label: tab.label(context),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}

// mock views
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.homePageTitle),
        actions: [
          TextButton(
            onPressed: () => context.read<AppCubit>().logout(),
            child: Text(context.l10n.logoutButton),
          ),
        ],
      ),
      body: Center(
        child: Text(context.l10n.homePageContent),
      ),
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.searchPageTitle)),
      body: Center(child: Text(context.l10n.searchPageContent)),
    );
  }
}

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.favoritePageTitle)),
      body: Center(child: Text(context.l10n.favoritePageContent)),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.profilePageTitle)),
      body: Center(child: Text(context.l10n.profilePageContent)),
    );
  }
}
