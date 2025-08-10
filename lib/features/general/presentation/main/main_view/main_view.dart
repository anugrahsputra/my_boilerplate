import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_boilerplate/app/app.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/di.dart';
import 'package:my_boilerplate/features/general/general.dart';

part 'main_view.component.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final appCubit = di<AppCubit>();
  final mainCubit = di<MainCubit>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(create: (context) => appCubit),
        BlocProvider<MainCubit>(create: (context) => MainCubit()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AppCubit, AppStatus>(
            listener: (context, state) {
              if (state == AppStatus.unauthenticated) {
                di<AppNavigator>().goToSplash(context);
              }
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
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: state.currentIndex,
                onTap: (index) =>
                    context.read<MainCubit>().changeTabByIndex(index),
                items: MainState.allTabs
                    .map(
                      (tab) => BottomNavigationBarItem(
                        icon: Icon(tab.icon),
                        label: tab.label,
                      ),
                    )
                    .toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}

// mock views
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(child: Text("Home View")),
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search")),
      body: Center(child: Text("Search View")),
    );
  }
}

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite")),
      body: Center(child: Text("Favorite View")),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(child: Text("Profile View")),
    );
  }
}
