import 'package:TribalTrove/feature/user/myCart/domain/entity/mycart_entity.dart';

class MyCartState {
  final bool isLoading;
  final List<MyCartEntity> cart;
  final bool showMessage;

  MyCartState({
    required this.isLoading,
    required this.cart,
    required this.showMessage,
  });

  factory MyCartState.initialState() =>
      MyCartState(isLoading: false, cart: [], showMessage: false);

  MyCartState copyWith({
    bool? isLoading,
    List<MyCartEntity>? cart,
    bool? showMessage,
  }) {
    return MyCartState(
      isLoading: isLoading ?? this.isLoading,
      cart: cart ?? this.cart,
      showMessage: showMessage ?? this.showMessage,
    );
  }
}
