part of 'main_cubit.dart';

@freezed
abstract class MainTab with _$MainTab {
  const factory MainTab.home() = _HomeTab;

  const factory MainTab.search() = _SearchTab;

  const factory MainTab.favorite() = _FavoriteTab;

  const factory MainTab.profile() = _ProfileTab;

  const MainTab._();

  String label(BuildContext context) => when(
    home: () => context.l10n.homeTab,
    search: () => context.l10n.searchTab,
    favorite: () => context.l10n.favoriteTab,
    profile: () => context.l10n.profileTab,
  );

  IconData get icon => when(
    home: () => Icons.home,
    search: () => Icons.search,
    favorite: () => Icons.favorite,
    profile: () => Icons.person,
  );

  int get index =>
      when(home: () => 0, search: () => 1, favorite: () => 2, profile: () => 3);
}
