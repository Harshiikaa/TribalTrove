import 'package:TribalTrove/feature/user/favorites/data/data_source/favorite_remote_data_source.dart';
import 'package:TribalTrove/feature/user/favorites/domain/entity/favorites_entity.dart';
import 'package:TribalTrove/feature/user/favorites/presentation/state/favorite_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getFavoriteViewModelProvider =
    StateNotifierProvider<GetFavoriteViewModel, FavoriteState>((ref) {
  final favoriteRemoteDataSource = ref.read(favoriteRemoteDataSourceProvider);
  return GetFavoriteViewModel(favoriteRemoteDataSource);
});

class GetFavoriteViewModel extends StateNotifier<FavoriteState> {
  final FavoriteRemoteDataSource favoriteRemoteDataSource;

  GetFavoriteViewModel(this.favoriteRemoteDataSource)
      : super(FavoriteState.initialState()) {
    getFavorite();
  }

  Future resetState() async {
    state = FavoriteState.initialState();
    getFavorite();
  }

  Future getFavorite() async {
    state = state.copyWith(isLoading: true);

    final currentState = state;
    final page = currentState.page + 1;
    final favorites = currentState.favorites;
    final hasReachedMax = currentState.hasReachedMax;
    if (!hasReachedMax) {
      // get data from data source
      final result = await favoriteRemoteDataSource.getFavorite(page);
      result.fold(
        (failure) =>
            state = state.copyWith(hasReachedMax: true, isLoading: false),
        (data) {
          if (data.isEmpty) {
            state = state.copyWith(hasReachedMax: true);
          } else {
            state = state.copyWith(
              favorites: [...favorites, ...data],
              page: page,
              isLoading: false,
            );
          }
        },
      );
    }
  }

// removing favorites
  Future<void> removeFavorite(FavoriteEntity favoriteID) async {
    try {
      await favoriteRemoteDataSource.removeFavorite(favoriteID);
    } catch (error) {
      print(error.toString());
    }
  }
}
