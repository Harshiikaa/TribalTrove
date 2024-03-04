import 'package:TribalTrove/feature/seller/product/data/model/product_api_model.dart';
import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  final String? cartID;
  final String? userID;
  final ProductAPIModel? productID;
  final DateTime createdAt;
  final int quantity;

  const CartEntity({
    this.cartID,
    this.userID,
    this.productID,
    required this.createdAt,
    required this.quantity,
  });

  @override
  List<Object?> get props => [cartID, userID, productID, createdAt, quantity];

  factory CartEntity.fromJson(Map<String, dynamic> json) => CartEntity(
      cartID: json['cartID'],
      userID: json['userID'],
      productID: json['productID'],
      createdAt: json['createdAt'],
      quantity: json['quantity']);

  @override
  String toString() {
    return 'FavoriteEntity( cartID: $cartID ,userID: $userID, productID: $productID, createdAt: $createdAt, quantity: $quantity)';
  }

  CartEntity copyWith({
    String? userID, // Include userId in copyWith
    ProductAPIModel? productID,
    DateTime? createdAt,
    int? quantity,
  }) {
    return CartEntity(
      userID: userID ?? this.userID,
      productID: productID ?? this.productID,
      createdAt: createdAt ?? this.createdAt,
      quantity: quantity ?? this.quantity,
    );
  }
}
