import 'package:TribalTrove/feature/user/myCart/domain/entity/mycart_entity.dart';
import 'package:TribalTrove/feature/user/myCart/domain/usecase/add_to_cart_usecase.dart';
import 'package:TribalTrove/feature/user/myCart/domain/usecase/get_cart_by_userID_usecase.dart';
import 'package:TribalTrove/feature/user/myCart/presentation/state/myCart_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myCartViewModelProvider =
    StateNotifierProvider.autoDispose<MyCartViewModel, MyCartState>(
        (ref) => MyCartViewModel(
              addToCartUseCase: ref.read(addToCartUseCaseProvider),
              getCartByUserIDUsecase: ref.read(getCartByUserIDUsecaseProvider),
// fetch fav
            ));

class MyCartViewModel extends StateNotifier<MyCartState> {
  final AddToCartUseCase addToCartUseCase;
  final GetCartByUserIDUsecase getCartByUserIDUsecase;
  MyCartViewModel(
      {required this.addToCartUseCase, required this.getCartByUserIDUsecase})
      : super(MyCartState.initialState());

  void addToCart(MyCartEntity cart) {
    state = state.copyWith(isLoading: true);
    addToCartUseCase.addToCart(cart).then((value) {
      value.fold(
        (failure) => state = state.copyWith(isLoading: false),
        (success) {
          state = state.copyWith(isLoading: false, showMessage: true);
          // fetch all data
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

  void resetMessage() {
    state = state.copyWith(showMessage: false, isLoading: false);
  }
}
