// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartAPIModel _$CartAPIModelFromJson(Map<String, dynamic> json) => CartAPIModel(
      cartID: json['_id'] as String?,
      userID: json['userID'] as String?,
      productID: json['productID'] as String?,
      createdAt: json['createdAt'] as String,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$CartAPIModelToJson(CartAPIModel instance) =>
    <String, dynamic>{
      '_id': instance.cartID,
      'userID': instance.userID,
      'productID': instance.productID,
      'createdAt': instance.createdAt,
      'quantity': instance.quantity,
    };
