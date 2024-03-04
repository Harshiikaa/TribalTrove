import 'package:TribalTrove/feature/user/myCart/data/data_source/cart_remote_data_source.dart';
import 'package:TribalTrove/feature/user/myCart/domain/entity/cart_entity.dart';
import 'package:TribalTrove/feature/user/myCart/presentation/state/cart_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCartViewModelProvider =
    StateNotifierProvider<GetCartViewModel, CartState>((ref) {
  final cartRemoteDataSource = ref.read(cartRemoteDataSourceProvider);
  return GetCartViewModel(cartRemoteDataSource);
});

class GetCartViewModel extends StateNotifier<CartState> {
  final CartRemoteDataSource cartRemoteDataSource;

  GetCartViewModel(this.cartRemoteDataSource)
      : super(CartState.initialState()) {
    getCart();
  }

  Future resetState() async {
    state = CartState.initialState();
    getCart();
  }

  Future getCart() async {
    // print('inside vm');
    state = state.copyWith(isLoading: true);

    final currentState = state;
    final page = currentState.page + 1;
    final cart = currentState.cart;
    final hasReachedMax = currentState.hasReachedMax;
    if (!hasReachedMax) {
      // get data from data source
      final result = await cartRemoteDataSource.getCart(page);
      result.fold(
        (failure) =>
            state = state.copyWith(hasReachedMax: true, isLoading: false),
        (data) {
          if (data.isEmpty) {
            state = state.copyWith(hasReachedMax: true);
          } else {
            state = state.copyWith(
              cart: [...cart, ...data],
              page: page,
              isLoading: false,
            );
          }
        },
      );
    }
  }

// removing from cart
  Future<void> removeFromCart(CartEntity cartID) async {
    try {
      await cartRemoteDataSource.removeFromCart(cartID);
    } catch (error) {
      print(error.toString());
    }
  }
}
