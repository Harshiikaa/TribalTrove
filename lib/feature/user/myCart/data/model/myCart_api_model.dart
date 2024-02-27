import 'package:TribalTrove/feature/user/myCart/domain/entity/mycart_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'myCart_api_model.g.dart';

@JsonSerializable()
class MyCartAPIModel {
  @JsonKey(name: '_id')
  final String? myCartID;
  final String? userID;
  final String? productID;
  final String createdAt;
  final int quantity;

  MyCartAPIModel(
      {this.myCartID,
      this.userID,
      this.productID,
      required this.createdAt,
      required this.quantity});

  // To json and fromJson without freezed
  factory MyCartAPIModel.fromJson(Map<String, dynamic> json) {
    return MyCartAPIModel(
      myCartID: json['_id'],
      userID: json['userID'],
      productID: json['productID']['productName']['productPrice']
          ['productImageURL'],
      createdAt: json['createdAt'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'myCartID': myCartID,
      'userID': userID,
      'productID': productID,
      'createdAt': createdAt,
      'quantity': quantity,
    };
  }

  // From entity to model
  factory MyCartAPIModel.fromEntity(MyCartEntity entity) {
    return MyCartAPIModel(
      myCartID: entity.myCartID,
      userID: entity.userID,
      productID: entity.productID,
      createdAt: entity.createdAt.toIso8601String(),
      quantity: entity.quantity,
    );
  }
  // From model to entity
  static MyCartEntity toEntity(MyCartAPIModel model) {
    return MyCartEntity(
        myCartID: model.myCartID,
        productID: model.productID,
        userID: model.userID,
        createdAt: DateTime.parse(model.createdAt),
        quantity: model.quantity);
  }
}
