// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_favorites_by_userID_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFavoritesByUserIDDTO _$GetFavoritesByUserIDDTOFromJson(
        Map<String, dynamic> json) =>
    GetFavoritesByUserIDDTO(
      success: json['success'] as bool,
      message: json['message'] as String,
      favorites: (json['favorites'] as List<dynamic>)
          .map((e) => FavoriteAPIModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetFavoritesByUserIDDTOToJson(
        GetFavoritesByUserIDDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'favorites': instance.favorites,
    };
