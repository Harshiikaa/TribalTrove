import 'package:equatable/equatable.dart';

class FavoriteEntity extends Equatable {
  final String? favoriteID;
  final String? userID;
  final String? productID;
  final DateTime createdAt;

  @override
  List<Object?> get props => [favoriteID, productID, createdAt];

  const FavoriteEntity({
    this.favoriteID,
    this.userID,
    this.productID,
    required this.createdAt,
  });

  @override
  String toString() {
    return 'FavoriteEntity( favoriteID: $favoriteID ,userID: $userID, productID: $productID, createdAt: $createdAt)';
  }
}
