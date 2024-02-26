import 'package:TribalTrove/config/routes/app_route.dart';
import 'package:TribalTrove/feature/user/favorites/data/data_source/favorite_remote_data_source.dart';
import 'package:TribalTrove/feature/user/favorites/data/dto/get_favorite_dto.dart';
import 'package:TribalTrove/feature/user/favorites/domain/entity/favorites_entity.dart';
import 'package:TribalTrove/feature/user/favorites/domain/usecases/create_favorite_usecase.dart';
import 'package:TribalTrove/feature/user/favorites/domain/usecases/get_favorite_usecase.dart';
import 'package:TribalTrove/feature/user/favorites/presentation/state/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteViewModelProvider =
    StateNotifierProvider.autoDispose<FavoriteViewModel, FavoriteState>(
        (ref) => FavoriteViewModel(
              createFavoriteUseCase: ref.read(createFavoriteUseCaseProvider),
              getFavoriteUsecase: ref.read(getFavoriteUsecaseProvider),
// fetch fav
            ));

class FavoriteViewModel extends StateNotifier<FavoriteState> {
  final CreateFavoriteUseCase createFavoriteUseCase;
  final GetFavoriteUsecase getFavoriteUsecase;
  FavoriteViewModel(
      {required this.createFavoriteUseCase, required this.getFavoriteUsecase})
      : super(FavoriteState.initialState());
  //   getFavorite()
  //   // fetch data
  // }

  void createFavorite(FavoriteEntity favorite) {
    state = state.copyWith(isLoading: true);
    createFavoriteUseCase.createFavorite(favorite).then((value) {
      value.fold(
        (failure) => state = state.copyWith(isLoading: false),
        (success) {
          state = state.copyWith(isLoading: false, showMessage: true);
          // fetch all data
        },
      );
    });
  }

  // Future getFavorite() async {
  //   state = state.copyWith(isLoading: true);

  //   final currentState = state;
  //   final page = currentState.page + 1;
  //   final favorites = currentState.favorites;
  //   final hasReachedMax = currentState.hasReachedMax;
  //   if (!hasReachedMax) {
  //     // get data from data source
  //     final result = await favoriteRemoteDataSourceProvider.getFavorite(page);
  //     result.fold(
  //       (failure) =>
  //           state = state.copyWith(hasReachedMax: true, isLoading: false),
  //       (data) {
  //         if (data.isEmpty) {
  //           state = state.copyWith(hasReachedMax: true);
  //         } else {
  //           state = state.copyWith(
  //             favorites: [...favorites, ...data],
  //             page: page,
  //             isLoading: false,
  //           );
  //         }
  //       },
  //     );
  //   }
  // }

  //   Future<void> removeFavorite(FavoriteEntity favoriteID) async {
  //   try {
  //     await favoriteRemoteDataSource.removeFavorite(favoriteID);
  //   } catch (error) {
  //     print(error.toString());
  //   }
  // }

  void reset() {
    state = state.copyWith(
      isLoading: false,
      showMessage: false,
    );
  }

  void resetMessage() {
    state = state.copyWith(showMessage: false, isLoading: false);
  }
}
