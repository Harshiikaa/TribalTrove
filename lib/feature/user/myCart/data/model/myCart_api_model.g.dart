// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myCart_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCartAPIModel _$MyCartAPIModelFromJson(Map<String, dynamic> json) =>
    MyCartAPIModel(
      myCartID: json['_id'] as String?,
      userID: json['userID'] as String?,
      productID: json['productID'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$MyCartAPIModelToJson(MyCartAPIModel instance) =>
    <String, dynamic>{
      '_id': instance.myCartID,
      'userID': instance.userID,
      'productID': instance.productID,
      'createdAt': instance.createdAt.toIso8601String(),
      'quantity': instance.quantity,
    };
