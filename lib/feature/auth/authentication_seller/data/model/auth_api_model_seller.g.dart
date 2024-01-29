// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_model_seller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthApiModelSeller _$AuthApiModelSellerFromJson(Map<String, dynamic> json) =>
    AuthApiModelSeller(
      sellerId: json['_id'] as String?,
      businessName: json['businessName'] as String,
      businessPhone: json['businessPhone'] as String,
      email: json['email'] as String,
      businessAddress: json['businessAddress'] as String?,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AuthApiModelSellerToJson(AuthApiModelSeller instance) =>
    <String, dynamic>{
      '_id': instance.sellerId,
      'businessName': instance.businessName,
      'businessPhone': instance.businessPhone,
      'businessAddress': instance.businessAddress,
      'email': instance.email,
      'password': instance.password,
    };
