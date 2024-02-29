import 'package:equatable/equatable.dart';

class MyCartEntity extends Equatable {
  final String? myCartID;
  final String? userID;
  final String? productID;
  final DateTime createdAt;
  final int quantity;

  @override
  List<Object?> get props => [myCartID, userID, productID,createdAt,quantity];

  const MyCartEntity({
    this.myCartID,
    this.userID,
    this.productID,
    required this.createdAt,
    required this.quantity,
  });

  // factory MyCartEntity.fromJson(Map<String, dynamic> json) => MyCartEntity(
  //     myCartID: json['myCartID'],
  //     userID: json['userID'],
  //     productID: json['productID']['productName'],
  //     createdAt: json['createdAt'],
  //     quantity: json['quantity']);

  @override
  String toString() {
    return 'FavoriteEntity( myCartID: $myCartID ,userID: $userID, productID: $productID, createdAt: $createdAt, quantity: $quantity)';
  }

  // MyCartEntity copyWith({
  //   String? productID,
  //   DateTime? createdAt,
  //   String? userID,
  //   int? quantity, // Include userId in copyWith
  // }) {
  //   return MyCartEntity(
  //     productID: productID ?? this.productID,
  //     createdAt: createdAt ?? this.createdAt,
  //     userID: userID ?? this.userID,
  //     quantity: quantity ?? this.quantity,
  //   );
  // }
}
