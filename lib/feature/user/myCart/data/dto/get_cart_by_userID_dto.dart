
import 'package:TribalTrove/feature/user/myCart/data/model/myCart_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_cart_by_userID_dto.g.dart';
@JsonSerializable()
class GetCartByUserIDDTO {
  final bool success;
  final String message;
  final List<MyCartAPIModel> cart;

  GetCartByUserIDDTO({
    required this.success,
    required this.message,
    required this.cart,
  });

  factory GetCartByUserIDDTO.fromJson(Map<String, dynamic> json) =>
      _$GetCartByUserIDDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetCartByUserIDDTOToJson(this);

  static GetCartByUserIDDTO toEntity(GetCartByUserIDDTO getCartByUserIDDTO) {
    return GetCartByUserIDDTO(
      success: getCartByUserIDDTO.success,
      message: getCartByUserIDDTO.message,
      cart: getCartByUserIDDTO.cart,
    );
  }

  static GetCartByUserIDDTO fromEntity(GetCartByUserIDDTO getCartByUserIDDTO) {
    return GetCartByUserIDDTO(
      success: getCartByUserIDDTO.success,
      message: getCartByUserIDDTO.message,
      cart: getCartByUserIDDTO.cart,
    );
  }
}
