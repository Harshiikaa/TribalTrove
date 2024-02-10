import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? productID;
  final String productName;
  final String productPrice;
  final String productCategory;
  final String productDescription;
  final String? productImage;

  @override
  List<Object?> get props => [
        productID,
        productName,
        productPrice,
        productCategory,
        productDescription,
        productImage
      ];

  const ProductEntity({
    this.productID,
    required this.productName,
    required this.productPrice,
    required this.productCategory,
    required this.productDescription,
    this.productImage,
  });

  @override
  String toString() {
    return 'ProductEntity(productID: $productID, productName: $productName,productPrice: $productPrice,productCategory: $productCategory,productDescription: $productDescription, productImage: $productImage)';
  }
}
