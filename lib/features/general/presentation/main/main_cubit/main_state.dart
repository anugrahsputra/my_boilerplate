part of 'main_cubit.dart';

@freezed
abstract class MainState with _$MainState {
  const factory MainState({
    @Default(MainTab.home()) MainTab currentTab,
    @Default({}) Map<MainTab, Widget> pages,
    @Default({}) Map<MainTab, int> badges,
    @Default(false) bool isLoading,
  }) = _MainState;

  const MainState._();

  Widget get currentPage => pages[currentTab] ?? const SizedBox.shrink();
  int get currentIndex => currentTab.index;
  bool get hasCurrentPage => pages.containsKey(currentTab);
  int getBadgeCount(MainTab tab) => badges[tab] ?? 0;
  bool hasBadge(MainTab tab) => badges.containsKey(tab) && badges[tab]! > 0;

  static List<MainTab> get allTabs => [
    const MainTab.home(),
    const MainTab.search(),
    const MainTab.favorite(),
    const MainTab.profile(),
  ];
}
