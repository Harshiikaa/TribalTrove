
import 'package:TribalTrove/feature/user/favorites/data/model/favorite_api_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'get_favorites_by_userID_dto.g.dart';
@JsonSerializable()
class GetFavoritesByUserIDDTO {
  final bool success;
  final String message;
  final List<FavoriteAPIModel> favorites;

  GetFavoritesByUserIDDTO({
    required this.success,
    required this.message,
    required this.favorites,
  });

  factory GetFavoritesByUserIDDTO.fromJson(Map<String, dynamic> json) =>
      _$GetFavoritesByUserIDDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetFavoritesByUserIDDTOToJson(this);

  static GetFavoritesByUserIDDTO toEntity(GetFavoritesByUserIDDTO getAllProductsDTO) {
    return GetFavoritesByUserIDDTO(
      success: getAllProductsDTO.success,
      message: getAllProductsDTO.message,
      favorites: getAllProductsDTO.favorites,
    );
  }

  static GetFavoritesByUserIDDTO fromEntity(GetFavoritesByUserIDDTO getAllProductsDTO) {
    return GetFavoritesByUserIDDTO(
      success: getAllProductsDTO.success,
      message: getAllProductsDTO.message,
      favorites: getAllProductsDTO.favorites,
    );
  }
}
