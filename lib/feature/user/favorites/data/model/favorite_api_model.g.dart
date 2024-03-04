// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteAPIModel _$FavoriteAPIModelFromJson(Map<String, dynamic> json) =>
    FavoriteAPIModel(
      favoriteID: json['_id'] as String?,
      userID: json['userID'] as String?,
      productID: json['productID'] == null
          ? null
          : ProductAPIModel.fromJson(json['productID'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$FavoriteAPIModelToJson(FavoriteAPIModel instance) =>
    <String, dynamic>{
      '_id': instance.favoriteID,
      'userID': instance.userID,
      'productID': instance.productID,
      'createdAt': instance.createdAt.toIso8601String(),
    };
