import 'package:TribalTrove/feature/user/favorites/domain/entity/favorite_entity.dart';

class FavoriteState {
  final bool isLoading;
  final String? error;
  final List<FavoriteEntity> favorites;
  final bool showMessage;
  final int page;
  final bool hasReachedMax;
  final String? message;

  FavoriteState(
      {required this.isLoading,
      this.error,
      required this.favorites,
      required this.showMessage,
      required this.page,
      required this.hasReachedMax,
      this.message});

  factory FavoriteState.initialState() => FavoriteState(
      isLoading: false,
      error: null,
      favorites: [],
      showMessage: false,
      page: 0,
      hasReachedMax: false);

  FavoriteState copyWith(
      {bool? isLoading,
      String? error,
      List<FavoriteEntity>? favorites,
      bool? showMessage,
      bool? hasReachedMax,
      String? message,
      int? page}) {
    return FavoriteState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        favorites: favorites ?? this.favorites,
        showMessage: showMessage ?? this.showMessage,
        page: page ?? this.page,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        message: message ?? this.message);
  }
}
