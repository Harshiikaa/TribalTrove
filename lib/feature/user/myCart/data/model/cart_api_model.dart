import 'package:TribalTrove/feature/seller/product/data/model/product_api_model.dart';
import 'package:TribalTrove/feature/user/myCart/domain/entity/cart_entity.dart';
import 'package:TribalTrove/feature/user/myCart/domain/entity/carts_entity.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CartsAPIModel {
  @JsonKey(name: '_id')
  final String? cartID;
  final String? userID;
  final Map<String, dynamic>? productID;
  final String createdAt;
  final int quantity;

  CartsAPIModel(
      {this.cartID,
      this.userID,
      required this.productID,
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

  factory CartsAPIModel.fromJson(Map<String, dynamic> json) {
    return CartsAPIModel(
      cartID: json['_id'],
      userID: json['userID'],
      productID: json['productID'],
      createdAt: json['createdAt'],
      quantity: json['quantity'],
    );
  }

  // From entity to model
  factory CartsAPIModel.fromEntity(CartsEntity entity) {
    return CartsAPIModel(
      cartID: entity.cartID,
      userID: entity.userID,
      productID: entity.productID,
      createdAt: entity.createdAt.toIso8601String(),
      quantity: entity.quantity,
    );
  }
  // From model to entity
  static CartsEntity toEntity(CartsAPIModel model) {
    return CartsEntity(
        cartID: model.cartID,
        productID: model.productID,
        userID: model.userID,
        createdAt: DateTime.parse(model.createdAt),
        quantity: model.quantity);
  }
}
