import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_boilerplate/features/general/general.dart';

part 'main_cubit.freezed.dart';

part 'main_state.dart';

part 'main_tab.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit()
    : super(
        MainState(
          pages: {
            const MainTab.home(): const HomeView(),
            const MainTab.search(): const SearchView(),
            const MainTab.favorite(): const FavoriteView(),
            const MainTab.profile(): const ProfileView(),
          },
        ),
      );

  void changeTab(MainTab tab) {
    emit(state.copyWith(currentTab: tab));
  }

  void changeTabByIndex(int index) {
    final tabs = MainState.allTabs;
    if (index >= 0 && index < tabs.length) {
      changeTab(tabs[index]);
    }
  }

  void updateBadge(MainTab tab, int count) {
    final badges = Map<MainTab, int>.from(state.badges);
    if (count > 0) {
      badges[tab] = count;
    } else {
      badges.remove(tab);
    }
    emit(state.copyWith(badges: badges));
  }

  void clearBadge(MainTab tab) {
    final badges = Map<MainTab, int>.from(state.badges);
    badges.remove(tab);
    emit(state.copyWith(badges: badges));
  }

  void clearAllBadges() {
    emit(state.copyWith(badges: {}));
  }

  void setLoading(bool loading) {
    emit(state.copyWith(isLoading: loading));
  }

  void addPage(MainTab tab, Widget page) {
    final pages = Map<MainTab, Widget>.from(state.pages);
    pages[tab] = page;
    emit(state.copyWith(pages: pages));
  }

  void removePage(MainTab tab) {
    final pages = Map<MainTab, Widget>.from(state.pages);
    pages.remove(tab);
    emit(state.copyWith(pages: pages));
  }
}
