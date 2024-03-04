import 'package:TribalTrove/feature/seller/product/data/model/product_api_model.dart';
import 'package:equatable/equatable.dart';

class CartsEntity extends Equatable {
  final String? cartID;
  final String? userID;
  final Map<String, dynamic>? productID;
  final DateTime createdAt;
  final int quantity;

  const CartsEntity({
    this.cartID,
    this.userID,
    required this.productID,
    required this.createdAt,
    required this.quantity,
  });

  @override
  List<Object?> get props => [cartID, userID, productID, createdAt, quantity];

  factory CartsEntity.fromJson(Map<String, dynamic> json) => CartsEntity(
      cartID: json['cartID'],
      userID: json['userID'],
      productID: json['productID'],
      createdAt: json['createdAt'],
      quantity: json['quantity']);

  @override
  String toString() {
    return 'FavoriteEntity( cartID: $cartID ,userID: $userID, productID: $productID, createdAt: $createdAt, quantity: $quantity)';
  }

  CartsEntity copyWith({
    required Map<String, dynamic>? productID,
    String? userID, // Include userId in copyWith
    DateTime? createdAt,
    int? quantity,
  }) {
    return CartsEntity(
      productID: productID,
      userID: userID ?? this.userID,
      createdAt: createdAt ?? this.createdAt,
      quantity: quantity ?? this.quantity,
    );
  }
}
