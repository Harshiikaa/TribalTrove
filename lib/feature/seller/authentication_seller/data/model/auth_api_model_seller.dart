import 'package:TribalTrove/feature/seller/authentication_seller/domain/entity/auth_entity_seller.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_api_model_seller.g.dart';

@JsonSerializable()
class AuthApiModelSeller {
  @JsonKey(name: '_id')
  final String? sellerID;
  final String businessName;
  final String businessPhone;
  final String? businessAddress;
  final String email;
  final String password;

  AuthApiModelSeller({
    this.sellerID,
    required this.businessName,
    required this.businessPhone,
    required this.email,
    this.businessAddress,
    // required this.username,
    required this.password,
  });

  factory AuthApiModelSeller.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelSellerFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelSellerToJson(this);

  // To entity
  factory AuthApiModelSeller.toEntity(AuthApiModelSeller apiModel) {
    return AuthApiModelSeller(
      sellerID: apiModel.sellerID,
      businessName: apiModel.businessName,
      businessAddress: apiModel.businessAddress,
      businessPhone: apiModel.businessPhone,
      email: apiModel.email,
      password: apiModel.password,
    );
  }

  // From entity
  factory AuthApiModelSeller.fromEntity(AuthEntitySeller entity) {
    return AuthApiModelSeller(
      sellerID: entity.sellerID,
      businessName: entity.businessName,
      businessAddress: entity.businessAddress,
      businessPhone: entity.businessPhone,
      email: entity.email,
      password: entity.password,
    );
  }
}
