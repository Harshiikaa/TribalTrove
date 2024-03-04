// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartAPIModel _$CartAPIModelFromJson(Map<String, dynamic> json) => CartAPIModel(
      cartID: json['_id'] as String?,
      userID: json['userID'] as String?,
      productID: json['productID'] == null
          ? null
          : ProductAPIModel.fromJson(json['productID'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$CartAPIModelToJson(CartAPIModel instance) =>
    <String, dynamic>{
      '_id': instance.cartID,
      'userID': instance.userID,
      'productID': instance.productID,
      'createdAt': instance.createdAt.toIso8601String(),
      'quantity': instance.quantity,
    };
