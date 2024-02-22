// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cart_by_userID_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCartByUserIDDTO _$GetCartByUserIDDTOFromJson(Map<String, dynamic> json) =>
    GetCartByUserIDDTO(
      success: json['success'] as bool,
      message: json['message'] as String,
      cart: (json['cart'] as List<dynamic>)
          .map((e) => MyCartAPIModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCartByUserIDDTOToJson(GetCartByUserIDDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'cart': instance.cart,
    };
