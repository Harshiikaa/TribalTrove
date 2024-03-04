import 'package:TribalTrove/feature/user/favorites/domain/entity/favorite_entity.dart';
import 'package:TribalTrove/feature/user/favorites/domain/entity/favorites_entity.dart';

class FavoritesState {
  final bool isLoading;
  final String? error;
  final List<FavoritesEntity> favorites;
  final bool showMessage;
  final int page;
  final bool hasReachedMax;
  final String? message;

  FavoritesState(
      {required this.isLoading,
      this.error,
      required this.favorites,
      required this.showMessage,
      required this.page,
      required this.hasReachedMax,
      this.message});

  factory FavoritesState.initialState() => FavoritesState(
      isLoading: false,
      error: null,
      favorites: [],
      showMessage: false,
      page: 0,
      hasReachedMax: false);

  FavoritesState copyWith(
      {bool? isLoading,
      String? error,
      List<FavoritesEntity>? favorites,
      bool? showMessage,
      bool? hasReachedMax,
      String? message,
      int? page}) {
    return FavoritesState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        favorites: favorites ?? this.favorites,
        showMessage: showMessage ?? this.showMessage,
        page: page ?? this.page,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        message: message ?? this.message);
  }
}
