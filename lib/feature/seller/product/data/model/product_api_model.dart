import 'package:TribalTrove/feature/seller/product/domain/entity/product_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_api_model.g.dart';
@JsonSerializable()
class ProductAPIModel {
  @JsonKey(name: '_id')
  final String? productID;
  final String productName;
  final String productPrice;
  final String productCategory;
  final String productDescription;
  final String? productImage;

  ProductAPIModel(
      {this.productID,
      required this.productName,
      required this.productPrice,
      required this.productCategory,
      required this.productDescription,
      this.productImage});

  // To Json and fromJson without freezed
  factory ProductAPIModel.fromJson(Map<String, dynamic> json) {
    return ProductAPIModel(
      productID: json['_id'],
      productName: json['productName'],
      productPrice: json['productPrice'],
      productCategory: json['productCategory'],
      productDescription: json['productDescription'],
      productImage: json['productImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'productPrice': productPrice,
      'productCategory': productCategory,
      'productDescription': productDescription,
      'productImage': productImage,
    };
  }

  // From entity to model
  factory ProductAPIModel.fromEntity(ProductEntity entity) {
    return ProductAPIModel(
      productID: entity.productID,
      productName: entity.productName,
      productPrice: entity.productPrice,
      productCategory: entity.productCategory,
      productDescription: entity.productDescription,
      productImage: entity.productImage,
    );
  }

  // From model to entity
  static ProductEntity toEntity(ProductAPIModel model) {
    return ProductEntity(
      productID: model.productID,
      productName: model.productName,
      productPrice: model.productPrice,
      productCategory: model.productCategory,
      productDescription: model.productDescription,
      productImage: model.productImage,
    );
  }
}
