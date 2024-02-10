import 'package:TribalTrove/feature/seller/product/data/model/product_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_products_dto.g.dart';

@JsonSerializable()
class GetAllProductsDTO {
  final bool success;
  final int count;
  final List<ProductAPIModel> data;

  GetAllProductsDTO({
    required this.success,
    required this.count,
    required this.data,
  });

  factory GetAllProductsDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllProductsDTOToJson(this);
}
