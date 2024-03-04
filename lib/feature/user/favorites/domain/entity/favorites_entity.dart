import 'package:TribalTrove/feature/seller/product/data/model/product_api_model.dart';
import 'package:TribalTrove/feature/seller/product/domain/entity/product_entity.dart';
import 'package:equatable/equatable.dart';

class FavoriteEntity extends Equatable {
  final String? favoriteID;
  final String? userID;
  final ProductAPIModel? productID;
  final DateTime createdAt;

  const FavoriteEntity({
    this.favoriteID,
    this.userID,
    this.productID,
    required this.createdAt,
  });

  List<Object?> get props => [favoriteID, userID, productID, createdAt];

  factory FavoriteEntity.fromJson(Map<String, dynamic> json) => FavoriteEntity(
      favoriteID: json['favoriteID'],
      userID: json['userID'],
      productID: json['productID'],
      createdAt: json['createdAt']);

  @override
  String toString() {
    return 'FavoriteEntity( favoriteID: $favoriteID ,userID: $userID, productID: $productID, createdAt: $createdAt)';
  }

  FavoriteEntity copyWith({
    ProductAPIModel? productID,
    DateTime? createdAt,
    String? userID, // Include userId in copyWith
  }) {
    return FavoriteEntity(
      productID: productID ?? this.productID,
      createdAt: createdAt ?? this.createdAt,
      userID: userID ?? this.userID,
    );
  }
}
