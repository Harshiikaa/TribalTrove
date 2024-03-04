import 'package:TribalTrove/feature/user/myCart/domain/entity/cart_entity.dart';
import 'package:TribalTrove/feature/user/myCart/domain/entity/carts_entity.dart';

class CartsState {
  final bool isLoading;
  final String? error;
  final List<CartsEntity> cart;
  final bool? showMessage;
  final String? message;
  final int page;
  final bool hasReachedMax;

  CartsState({
    required this.isLoading,
    this.error,
    required this.cart,
    this.showMessage,
    required this.page,
    required this.hasReachedMax,
    this.message,
  });

  factory CartsState.initialState() => CartsState(
      isLoading: false,
      error: null,
      cart: [],
      showMessage: false,
      message: null,
      page: 0,
      hasReachedMax: false);

  CartsState copyWith(
      {bool? isLoading,
      bool? showMessage,
      String? error,
      List<CartsEntity>? cart,
      bool? hasReachedMax,
      String? message,
      int? page}) {
    return CartsState(
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
