import 'package:TribalTrove/feature/user/myCart/domain/entity/mycart_entity.dart';

class MyCartState {
  final bool isLoading;
  final List<MyCartEntity> cart;
  final bool showMessage;
  final int page;
  final bool hasReachedMax;

  MyCartState(
      {required this.isLoading,
      required this.cart,
      required this.showMessage,
      required this.page,
      required this.hasReachedMax});

  factory MyCartState.initialState() => MyCartState(
      isLoading: false,
      cart: [],
      showMessage: false,
      page: 0,
      hasReachedMax: false);

  MyCartState copyWith(
      {bool? isLoading,
      List<MyCartEntity>? cart,
      bool? showMessage,
      bool? hasReachedMax,
      int? page}) {
    return MyCartState(
      isLoading: isLoading ?? this.isLoading,
      cart: cart ?? this.cart,
      showMessage: showMessage ?? this.showMessage,
        page: page?? this.page,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
