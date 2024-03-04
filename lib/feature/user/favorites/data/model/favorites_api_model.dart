import 'dart:developer';

import 'package:TribalTrove/feature/seller/product/domain/entity/product_entity.dart';
import 'package:TribalTrove/feature/user/favorites/domain/entity/favorite_entity.dart';
import 'package:TribalTrove/feature/user/favorites/domain/entity/favorites_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../seller/product/data/model/product_api_model.dart';


@JsonSerializable()
class FavoritesAPIModel {
  @JsonKey(name: '_id')
  final String? favoriteID;
  final String? userID;
  Map<String, dynamic>? productID;
  final String createdAt;

  FavoritesAPIModel({
    this.favoriteID,
    this.userID,
    this.productID,
    required this.createdAt,
  });

  // To json and fromJson without freezed

   Map<String, dynamic> toJson() {
    return {
      'favoriteID': favoriteID,
      'userID': userID,
      'productID': productID,
      'createdAt': createdAt,
    };
  }

  factory FavoritesAPIModel.fromJson(Map<String, dynamic> json) {
    return FavoritesAPIModel(
      favoriteID: json['_id'],
      userID: json['userID'],
      productID:json['productID'],
      createdAt: json['createdAt'],
    );
  }

 

  // Map<String, dynamic> toJsonForApi() {
  //   return {
  //     'favoriteID': favoriteID,
  //     'userID': userID,
  //     'productID': productID?.productID,
  //     'createdAt': createdAt.toIso8601String(),
  //   };
  // }

  // From entity to model
  factory FavoritesAPIModel.fromEntity(FavoritesEntity entity) {
    return FavoritesAPIModel(
      favoriteID: entity.favoriteID,
      userID: entity.userID,
      productID: entity.productID,
      createdAt: entity.createdAt.toIso8601String(),
    );
  }
  // From model to entity
  static FavoritesEntity toEntity(FavoritesAPIModel model) {
    return FavoritesEntity(
      productID: model.productID,
      favoriteID: model.favoriteID,
      userID: model.userID,
      createdAt: DateTime.parse(model.createdAt),
    );
  }
}
