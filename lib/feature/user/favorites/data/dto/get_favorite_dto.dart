import 'package:TribalTrove/feature/user/favorites/data/model/favorite_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_favorite_dto.g.dart';

@JsonSerializable()
class GetFavoriteDTO {
  final bool success;
  final String message;
  @JsonKey(name: 'favorites')
  final List<FavoriteAPIModel> favorites;

  GetFavoriteDTO({
    required this.success,
    required this.message,
    required this.favorites,
  });

  factory GetFavoriteDTO.fromJson(Map<String, dynamic> json) =>
      _$GetFavoriteDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetFavoriteDTOToJson(this);

  static GetFavoriteDTO toEntity(GetFavoriteDTO getAllProductsDTO) {
    return GetFavoriteDTO(
      success: getAllProductsDTO.success,
      message: getAllProductsDTO.message,
      favorites: getAllProductsDTO.favorites,
    );
  }

  static GetFavoriteDTO fromEntity(GetFavoriteDTO getAllProductsDTO) {
    return GetFavoriteDTO(
      success: getAllProductsDTO.success,
      message: getAllProductsDTO.message,
      favorites: getAllProductsDTO.favorites,
    );
  }
}
