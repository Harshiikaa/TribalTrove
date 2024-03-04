import 'package:TribalTrove/feature/user/myCart/data/model/cart_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_cart_dto.g.dart';

@JsonSerializable()
class GetCartDTO {
  final bool success;
  final String message;
    @JsonKey(name: 'cart')
  final List<CartAPIModel> cart;

  GetCartDTO({
    required this.success,
    required this.message,
    required this.cart,
  });

  factory GetCartDTO.fromJson(Map<String, dynamic> json) =>
      _$GetCartDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetCartDTOToJson(this);

  static GetCartDTO toEntity(GetCartDTO getCartDTO) {
    return GetCartDTO(
      success: getCartDTO.success,
      message: getCartDTO.message,
      cart: getCartDTO.cart,
    );
  }

  static GetCartDTO fromEntity(GetCartDTO getCartDTO) {
    return GetCartDTO(
      success: getCartDTO.success,
      message: getCartDTO.message,
      cart: getCartDTO.cart,
    );
  }
}
