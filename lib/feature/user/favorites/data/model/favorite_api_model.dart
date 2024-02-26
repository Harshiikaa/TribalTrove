import 'package:TribalTrove/feature/user/favorites/domain/entity/favorites_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorite_api_model.g.dart';

@JsonSerializable()
class FavoriteAPIModel {
  @JsonKey(name: '_id')
  final String? favoriteID;
  final String? userID;
  final String? productID;
  final String createdAt;

  FavoriteAPIModel({
    this.favoriteID,
    this.userID,
    this.productID,
    required this.createdAt,
  });

  // To json and fromJson without freezed
  factory FavoriteAPIModel.fromJson(Map<String, dynamic> json) {
    return FavoriteAPIModel(
      favoriteID: json['_id'] ,
      userID: json['userID'],
      productID: json['productID'] ,
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'favoriteID': favoriteID,
      'userID': userID,
      'productID': productID,
      'createdAt': createdAt,
    };
  }

  // From entity to model
  factory FavoriteAPIModel.fromEntity(FavoriteEntity entity) {
    return FavoriteAPIModel(
      favoriteID: entity.favoriteID,
      userID: entity.userID,
      productID: entity.productID,
      createdAt: entity.createdAt.toIso8601String(),
    );
  }
  // From model to entity
  static FavoriteEntity toEntity(FavoriteAPIModel model) {
    return FavoriteEntity(
      productID: model.productID,
      favoriteID: model.favoriteID,
      userID: model.userID,
      createdAt: DateTime.parse(model.createdAt),
    );
  }
}
