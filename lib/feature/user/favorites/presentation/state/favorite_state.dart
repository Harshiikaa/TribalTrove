import 'package:TribalTrove/feature/user/favorites/domain/entity/favorites_entity.dart';

class FavoriteState {
  final bool isLoading;
  final List<FavoriteEntity> favorites;
  final bool showMessage;
  final int page;
  final bool hasReachedMax;

  FavoriteState({
    required this.isLoading,
    required this.favorites,
    required this.showMessage,
    required this.page,
    required this.hasReachedMax
  });

  factory FavoriteState.initialState() =>
      FavoriteState(isLoading: false, favorites: [], showMessage: false, page: 0,hasReachedMax: false);

  FavoriteState copyWith({
    bool? isLoading,
    List<FavoriteEntity>? favorites,
    bool? showMessage,
    bool? hasReachedMax,
    int? page
  }) {
    return FavoriteState(
      isLoading: isLoading ?? this.isLoading,
      favorites: favorites ?? this.favorites,
      showMessage: showMessage ?? this.showMessage,
       page: page?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
