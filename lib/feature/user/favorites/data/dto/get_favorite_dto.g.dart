// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_favorite_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFavoriteDTO _$GetFavoriteDTOFromJson(Map<String, dynamic> json) =>
    GetFavoriteDTO(
      success: json['success'] as bool,
      message: json['message'] as String,
      favorites: (json['favorites'] as List<dynamic>)
          .map((e) => FavoriteAPIModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetFavoriteDTOToJson(GetFavoriteDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'favorites': instance.favorites,
    };
