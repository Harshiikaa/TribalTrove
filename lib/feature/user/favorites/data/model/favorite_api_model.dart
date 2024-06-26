import 'dart:developer';

import 'package:TribalTrove/feature/seller/product/domain/entity/product_entity.dart';
import 'package:TribalTrove/feature/user/favorites/domain/entity/favorite_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../seller/product/data/model/product_api_model.dart';

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

   Map<String, dynamic> toJson() {
    return {
      'favoriteID': favoriteID,
      'userID': userID,
      'productID': productID,
      'createdAt': createdAt,
    };
  }

  factory FavoriteAPIModel.fromJson(Map<String, dynamic> json) {
    return FavoriteAPIModel(
      favoriteID: json['_id'],
      userID: json['userID'],
      productID:json['productID']['productName'],
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
