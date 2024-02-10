// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_products_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllProductsDTO _$GetAllProductsDTOFromJson(Map<String, dynamic> json) =>
    GetAllProductsDTO(
      success: json['success'] as bool,
      count: json['count'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => ProductAPIModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllProductsDTOToJson(GetAllProductsDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data,
    };
