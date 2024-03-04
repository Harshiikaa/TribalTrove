import 'package:TribalTrove/core/shared_pref/user_shared_prefs.dart';
import 'package:TribalTrove/feature/user/myCart/data/data_source/cart_remote_data_source.dart';
import 'package:TribalTrove/feature/user/myCart/domain/entity/cart_entity.dart';
import 'package:TribalTrove/feature/user/myCart/domain/usecase/add_to_cart_usecase.dart';
import 'package:TribalTrove/feature/user/myCart/domain/usecase/get_cart_usecase.dart';
import 'package:TribalTrove/feature/user/myCart/presentation/state/cart_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartViewModelProvider =
    StateNotifierProvider<CartViewModel, CartState>((ref) => CartViewModel(
          addToCartUseCase: ref.read(addToCartUseCaseProvider),
          cartRemoteDataSource: ref.read(cartRemoteDataSourceProvider),
          // userSharedPrefs: ref.read(userSharedPrefsProvider)
// fetch fav
        ));

class CartViewModel extends StateNotifier<CartState> {
  final AddToCartUseCase addToCartUseCase;
  final CartRemoteDataSource cartRemoteDataSource;

  CartViewModel({
    required this.addToCartUseCase,
    required this.cartRemoteDataSource,
    // required this.userSharedPrefs
  }) : super(CartState.initialState());

  Future<void> addToCart(CartEntity entity, BuildContext context) async {
    state = state.copyWith(isLoading: true);
    final result = await addToCartUseCase.addToCart(entity);
    state = state.copyWith(isLoading: false);
    result.fold(
      (failure) => state = state.copyWith(error: failure.error),
      (success) => state = state.copyWith(isLoading: false, showMessage: true),
    );
    // showSnackBar(message: state.message!, context: context);
  }

  Future<void> removeFromCart(CartEntity cartID) async {
    try {
      await cartRemoteDataSource.removeFromCart(cartID);
    } catch (error) {
      print(error.toString());
    }
  }

  // void addToCart(CartEntity cart) {
  //   state = state.copyWith(isLoading: true);
  //   addToCartUseCase.addToCart(cart).then((value) {
  //     value.fold(
  //       (failure) => state = state.copyWith(isLoading: false),
  //       (success) {
  //         state = state.copyWith(isLoading: false, showMessage: true);
  //         // fetch all data
  //       },
  //     );
  //   });
  // }

  //   Future getCart() async {
  //   state = state.copyWith(isLoading: true);

  //   final currentState = state;
  //   final page = currentState.page + 1;
  //   final cart = currentState.cart;
  //   final hasReachedMax = currentState.hasReachedMax;
  //   if (!hasReachedMax) {
  //     // get data from data source
  //     final result = await myCartRemoteDataSource.getCart(page);
  //     result.fold(
  //       (failure) =>
  //           state = state.copyWith(hasReachedMax: true, isLoading: false),
  //       (data) {
  //         if (data.isEmpty) {
  //           state = state.copyWith(hasReachedMax: true);
  //         } else {
  //           state = state.copyWith(
  //             cart: [...cart, ...data],
  //             page: page,
  //             isLoading: false,
  //           );
  //         }
  //       },
  //     );
  //   }
  // }

  // Future<void> getCart() async {
  //   state = state.copyWith(isLoading: true);

  //   final currentState = state;
  //   final page = currentState.page + 1;
  //   final cart = currentState.cart;
  //   final hasReachedMax = currentState.hasReachedMax;

  //   if (!hasReachedMax) {
  //     userSharedPrefs.getUserToken().then((result) {
  //       result.fold(
  //         (failure) {
  //           state = state.copyWith(hasReachedMax: true, isLoading: false);
  //           print("Failed to get user details: ${failure.error}");
  //         },
  //         (userData) async {
  //           final
  //            = userData['_id'];

  //           // get data from data source
  //           final result = await getCartUsecase
  //               .getCart(page);

  //           result.fold((failure) => state = state.copyWith(isLoading: false),
  //               (data) {
  //             if (data.isEmpty) {
  //               state = state.copyWith(hasReachedMax: true, isLoading: false);
  //             } else {
  //               state = state.copyWith(
  //                 cart: [...cart, ...data],
  //                 page: page,
  //                 isLoading: false,
  //               );
  //             }
  //           });
  //         },
  //       );
  //     });
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
