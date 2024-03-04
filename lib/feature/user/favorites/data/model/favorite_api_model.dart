import 'dart:developer';

import 'package:TribalTrove/feature/seller/product/domain/entity/product_entity.dart';
import 'package:TribalTrove/feature/user/favorites/domain/entity/favorites_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../seller/product/data/model/product_api_model.dart';

part 'favorite_api_model.g.dart';

@JsonSerializable()
class FavoriteAPIModel {
  @JsonKey(name: '_id')
  final String? favoriteID;
  final String? userID;
  final ProductAPIModel? productID;
  final DateTime createdAt;

  FavoriteAPIModel({
    this.favoriteID,
    this.userID,
    this.productID,
    required this.createdAt,
  });

  // To json and fromJson without freezed
  factory FavoriteAPIModel.fromJson(Map<String, dynamic> json) {
    return FavoriteAPIModel(
      favoriteID: json['_id'],
      userID: json['userID'],
      productID: ProductAPIModel.fromJson(json['productID']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'favoriteID': favoriteID,
      'userID': userID,
      'productID': productID?.toJson(),
      'createdAt': createdAt.toIso8601String(),
    };
  }

  Map<String, dynamic> toJsonForApi() {
    return {
      'favoriteID': favoriteID,
      'userID': userID,
      'productID': productID?.productID,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // From entity to model
  factory FavoriteAPIModel.fromEntity(FavoriteEntity entity) {
    return FavoriteAPIModel(
      favoriteID: entity.favoriteID,
      userID: entity.userID,
      productID: entity.productID,
      createdAt: entity.createdAt,
    );
  }
  // From model to entity
  static FavoriteEntity toEntity(FavoriteAPIModel model) {
    return FavoriteEntity(
      productID: model.productID,
      favoriteID: model.favoriteID,
      userID: model.userID,
      createdAt: model.createdAt,
    );
  }
}
