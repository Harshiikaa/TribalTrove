import 'package:TribalTrove/feature/seller/product/data/model/product_api_model.dart';
import 'package:TribalTrove/feature/seller/product/domain/entity/product_entity.dart';
import 'package:equatable/equatable.dart';

class FavoritesEntity extends Equatable {
  final String? favoriteID;
  final String? userID;
   Map<String, dynamic>? productID;
  final DateTime createdAt;

  FavoritesEntity({
    this.favoriteID,
    this.userID,
    this.productID,
    required this.createdAt,
  });

  List<Object?> get props => [favoriteID, userID, productID, createdAt];

  factory FavoritesEntity.fromJson(Map<String, dynamic> json) => FavoritesEntity(
      favoriteID: json['favoriteID'],
      userID: json['userID'],
      productID: json['productID'],
      createdAt: json['createdAt']);

  @override
  String toString() {
    return 'FavoriteEntity( favoriteID: $favoriteID ,userID: $userID, productID: $productID, createdAt: $createdAt)';
  }

  FavoritesEntity copyWith({
    Map<String, dynamic>? productID,
    DateTime? createdAt,
    String? userID, // Include userId in copyWith
  }) {
    return FavoritesEntity(
      productID: productID ?? this.productID,
      createdAt: createdAt ?? this.createdAt,
      userID: userID ?? this.userID,
    );
  }
}
