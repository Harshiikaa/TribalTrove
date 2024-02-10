// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductAPIModel _$ProductAPIModelFromJson(Map<String, dynamic> json) =>
    ProductAPIModel(
      productID: json['_id'] as String?,
      productName: json['productName'] as String,
      productPrice: json['productPrice'] as String,
      productCategory: json['productCategory'] as String,
      productDescription: json['productDescription'] as String,
      productImage: json['productImage'] as String?,
    );

Map<String, dynamic> _$ProductAPIModelToJson(ProductAPIModel instance) =>
    <String, dynamic>{
      '_id': instance.productID,
      'productName': instance.productName,
      'productPrice': instance.productPrice,
      'productCategory': instance.productCategory,
      'productDescription': instance.productDescription,
      'productImage': instance.productImage,
    };
