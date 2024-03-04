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

  factory GetAllProductsDTO.fromJson(Map<String, dynamic> json) {
    print("Converting JSON to GetAllProductsDTO: $json");
    final result = _$GetAllProductsDTOFromJson(json);
    print("Converted result: $result");
    return result;
  }

  Map<String, dynamic> toJson() {
    print("Converting GetAllProductsDTO to JSON: $this");
    final result = _$GetAllProductsDTOToJson(this);
    print("Converted result: $result");
    return result;
  }

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
