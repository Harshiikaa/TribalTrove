import 'package:TribalTrove/feature/user/favorites/domain/entity/favorites_entity.dart';

class FavoriteState {
  final bool isLoading;
  final List<FavoriteEntity> favorites;
  final bool showMessage;

  FavoriteState({
    required this.isLoading,
    required this.favorites,
    required this.showMessage,
  });

  factory FavoriteState.initialState() =>
      FavoriteState(isLoading: false, favorites: [], showMessage: false);

  FavoriteState copyWith({
    bool? isLoading,
    List<FavoriteEntity>? favorites,
    bool? showMessage,
  }) {
    return FavoriteState(
      isLoading: isLoading ?? this.isLoading,
      favorites: favorites ?? this.favorites,
      showMessage: showMessage ?? this.showMessage,
    );
  }
}
