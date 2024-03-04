import 'package:TribalTrove/feature/seller/product/data/model/product_api_model.dart';
import 'package:TribalTrove/feature/user/myCart/domain/entity/cart_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartAPIModel {
  @JsonKey(name: '_id')
  final String? cartID;
  final String? userID;
  final String? productID;
  final String createdAt;
  final int quantity;

  CartAPIModel(
      {this.cartID,
      this.userID,
      this.productID,
      required this.createdAt,
      required this.quantity});

  // To json and fromJson without freezed

    Map<String, dynamic> toJson() {
    return {
      'cartID': cartID,
      'userID': userID,
      'productID': productID,
      'createdAt': createdAt,
      'quantity': quantity,
    };
  }

  factory CartAPIModel.fromJson(Map<String, dynamic> json) {
    return CartAPIModel(
      cartID: json['_id'],
      userID: json['userID'],
      productID:json['productID']['productName'],
      createdAt:json['createdAt'],
      quantity: json['quantity'],
    );
  }

  // From entity to model
  factory CartAPIModel.fromEntity(CartEntity entity) {
    return CartAPIModel(
      cartID: entity.cartID,
      userID: entity.userID,
      productID: entity.productID,
      createdAt: entity.createdAt.toIso8601String(),
      quantity: entity.quantity,
    );
  }
  // From model to entity
  static CartEntity toEntity(CartAPIModel model) {
    return CartEntity(
        cartID: model.cartID,
        productID: model.productID,
        userID: model.userID,
        createdAt: DateTime.parse(model.createdAt),
        quantity: model.quantity);
  }
}
