import 'package:TribalTrove/config/routes/app_route.dart';
import 'package:TribalTrove/feature/user/favorites/data/data_source/favorite_remote_data_source.dart';
import 'package:TribalTrove/feature/user/favorites/data/dto/get_favorite_dto.dart';
import 'package:TribalTrove/feature/user/favorites/domain/entity/favorite_entity.dart';
import 'package:TribalTrove/feature/user/favorites/domain/usecases/create_favorite_usecase.dart';
import 'package:TribalTrove/feature/user/favorites/domain/usecases/get_favorite_usecase.dart';
import 'package:TribalTrove/feature/user/favorites/presentation/state/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteViewModelProvider =
    StateNotifierProvider<FavoriteViewModel, FavoriteState>(
        (ref) => FavoriteViewModel(
              ref.read(createFavoriteUseCaseProvider),
              ref.read(favoriteRemoteDataSourceProvider),
// fetch fav
            ));

class FavoriteViewModel extends StateNotifier<FavoriteState> {
  final CreateFavoriteUseCase createFavoriteUseCase;
  final FavoriteRemoteDataSource favoriteRemoteDataSource;

  FavoriteViewModel(this.createFavoriteUseCase, this.favoriteRemoteDataSource)
      : super(FavoriteState.initialState());

  // void createFavorite(FavoriteEntity favorite) {
  //   state = state.copyWith(isLoading: true);
  //   createFavoriteUseCase.createFavorite(favorite).then((value) {
  //     value.fold(
  //       (failure) => state = state.copyWith(isLoading: false),
  //       (success) {
  //         state = state.copyWith(isLoading: false, showMessage: true);
  //         // fetch all data
  //       },
  //     );
  //   });
  // }

  Future<void> createFavorite(
      FavoriteEntity entity, BuildContext context) async {
    state = state.copyWith(isLoading: true);
    final result = await createFavoriteUseCase.createFavorite(entity);
    state = state.copyWith(isLoading: false);
    result.fold(
      (failure) => state = state.copyWith(error: failure.error),
      (success) => state = state.copyWith(isLoading: false, showMessage: true),
    );
  }

  Future<void> removeFavorite(FavoriteEntity favoriteID) async {
    try {
      await favoriteRemoteDataSource.removeFavorite(favoriteID);
    } catch (error) {
      print(error.toString());
    }
  }

  void reset() {
    state = state.copyWith(
      isLoading: false,
      error: null,
      showMessage: false,
    );
  }

  void resetMessage() {
    state = state.copyWith(showMessage: false, error: null, isLoading: false);
  }
}
