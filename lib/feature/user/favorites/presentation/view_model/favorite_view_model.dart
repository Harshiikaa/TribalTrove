import 'package:TribalTrove/feature/user/favorites/data/dto/get_favorites_by_userID_dto.dart';
import 'package:TribalTrove/feature/user/favorites/domain/entity/favorites_entity.dart';
import 'package:TribalTrove/feature/user/favorites/domain/usecases/create_favorite_usecase.dart';
import 'package:TribalTrove/feature/user/favorites/domain/usecases/get_favorite_by_userID_usecase.dart';
import 'package:TribalTrove/feature/user/favorites/presentation/state/favorite_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteViewModelProvider  = 
StateNotifierProvider.autoDispose<FavoriteViewModel, FavoriteState>(
  (ref) => FavoriteViewModel(
    createFavoriteUseCase: ref.read(createFavoriteUseCaseProvider),
    getFavoriteByUserIDUsecase : ref.read(getFavoriteByUserIDUsecaseProvider),
// fetch fav 
  ));

class FavoriteViewModel extends StateNotifier<FavoriteState> {
  final CreateFavoriteUseCase createFavoriteUseCase;
  final GetFavoriteByUserIDUsecase getFavoriteByUserIDUsecase;
  FavoriteViewModel({required this.createFavoriteUseCase, required this.getFavoriteByUserIDUsecase})
      : super(FavoriteState.initialState()) {
        getFavoriteByUserID();
    // fetch data
  }

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

   void getFavoriteByUserID() {
    state = state.copyWith(isLoading: true);
    getFavoriteByUserIDUsecase.getFavoriteByUserID().then((value) {
      value.fold(
        (failure) {
          state = state.copyWith(isLoading: false, );
        },
        (favorites) {
          state = state.copyWith(isLoading: false, favorites: favorites);
        },
      );
    });
  }


   void reset() {
    state = state.copyWith(
      isLoading: false,
      showMessage: false,
    );
  }

  void resetMessage(bool value) {
    state = state.copyWith(showMessage: value,isLoading: false);
  }
}
