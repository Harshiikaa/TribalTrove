import 'package:TribalTrove/feature/user/myCart/data/data_source/myCart_remote_data_source.dart';
import 'package:TribalTrove/feature/user/myCart/domain/entity/mycart_entity.dart';
import 'package:TribalTrove/feature/user/myCart/presentation/state/myCart_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCartViewModelProvider =
    StateNotifierProvider<GetCartViewModel, MyCartState>((ref) {
  final myCartRemoteDataSource = ref.read(myCartRemoteDataSourceProvider);
  return GetCartViewModel(myCartRemoteDataSource);
});

class GetCartViewModel extends StateNotifier<MyCartState> {
  final MyCartRemoteDataSource myCartRemoteDataSource;

  GetCartViewModel(this.myCartRemoteDataSource)
      : super(MyCartState.initialState()) {
    getCart();
  }

  Future resetState() async {
    state = MyCartState.initialState();
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
      final result = await myCartRemoteDataSource.getCart(page);
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
  Future<void> removeFromCart(MyCartEntity cartID) async {
    try {
      await myCartRemoteDataSource.removeFromCart(cartID);
    } catch (error) {
      print(error.toString());
    }
  }
}
