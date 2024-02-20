import 'package:TribalTrove/feature/seller/product/data/model/product_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_products_dto.g.dart';

@JsonSerializable()
class GetAllProductsDTO {
  final bool success;
  final String message;
  final List<ProductAPIModel> products;

  GetAllProductsDTO({
    required this.success,
    required this.message,
    required this.products,
  });

  factory GetAllProductsDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllProductsDTOToJson(this);

  static GetAllProductsDTO toEntity(GetAllProductsDTO getAllProductsDTO) {
    return GetAllProductsDTO(
      success: getAllProductsDTO.success,
      message: getAllProductsDTO.message,
      products: getAllProductsDTO.products,
    );
  }

  static GetAllProductsDTO fromEntity(GetAllProductsDTO getAllProductsDTO) {
    return GetAllProductsDTO(
      success: getAllProductsDTO.success,
      message: getAllProductsDTO.message,
      products: getAllProductsDTO.products,
    );
  }
}
