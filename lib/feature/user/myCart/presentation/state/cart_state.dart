import 'package:TribalTrove/feature/user/myCart/domain/entity/cart_entity.dart';

class CartState {
  final bool isLoading;
  final List<CartEntity> cart;
  final bool showMessage;
  final int page;
  final bool hasReachedMax;

  CartState(
      {required this.isLoading,
      required this.cart,
      required this.showMessage,
      required this.page,
      required this.hasReachedMax});

  factory CartState.initialState() => CartState(
      isLoading: false,
      cart: [],
      showMessage: false,
      page: 0,
      hasReachedMax: false);

  CartState copyWith(
      {bool? isLoading,
      List<CartEntity>? cart,
      bool? showMessage,
      bool? hasReachedMax,
      int? page}) {
    return CartState(
      isLoading: isLoading ?? this.isLoading,
      cart: cart ?? this.cart,
      showMessage: showMessage ?? this.showMessage,
      page: page ?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
