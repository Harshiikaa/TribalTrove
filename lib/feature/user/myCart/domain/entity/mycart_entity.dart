import 'package:equatable/equatable.dart';

class MyCartEntity extends Equatable {
  final String? myCartID;
  final String? userID;
  final String? productID;
  final DateTime createdAt;

  @override
  List<Object?> get props => [myCartID, userID, productID];

  const MyCartEntity({
    this.myCartID,
    this.userID,
    this.productID,
    required this.createdAt
  });

  @override
  String toString() {
    return 'FavoriteEntity( myCartID: $myCartID ,userID: $userID, productID: $productID, createdAt: $createdAt)';
  }
}
