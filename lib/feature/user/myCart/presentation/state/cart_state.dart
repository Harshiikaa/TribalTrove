import 'package:TribalTrove/feature/user/myCart/domain/entity/cart_entity.dart';

class CartState {
  final bool isLoading;
  final String? error;
  final List<CartEntity> cart;
  final bool? showMessage;
  final String? message;
  final int page;
  final bool hasReachedMax;

  CartState({
    required this.isLoading,
    this.error,
    required this.cart,
    this.showMessage,
    required this.page,
    this.message,
    required this.hasReachedMax,
  });

  factory CartState.initialState(){
    return CartState(
      isLoading: false,
      error: null,
      cart: [],
      showMessage: false,
      message: null,
      page: 0,
      hasReachedMax: false);

  } 

  CartState copyWith(
      {bool? isLoading,
      String? error,
      List<CartEntity>? cart,
      bool? showMessage,
      bool? hasReachedMax,
      String? message,
      int? page}) {
    return CartState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      cart: cart ?? this.cart,
      showMessage: showMessage ?? this.showMessage,
      message: message ?? this.message,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
