import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? productID;
  final String productName;
  final String productPrice;
  final String productCategory;
  final String productDescription;
  final String? productImageURL;
  final String? sellerID;

  @override
  List<Object?> get props => [
        productID,
        productName,
        productPrice,
        productCategory,
        productDescription,
        productImageURL,
        sellerID
      ];

  const ProductEntity({
    this.productID,
    required this.productName,
    required this.productPrice,
    required this.productCategory,
    required this.productDescription,
    this.productImageURL,
    this.sellerID
  });

  @override
  String toString() {
    return 'ProductEntity(productID: $productID, productName: $productName,productPrice: $productPrice,productCategory: $productCategory,productDescription: $productDescription, productImageURL: $productImageURL, sellerID : $sellerID)';
  }
}