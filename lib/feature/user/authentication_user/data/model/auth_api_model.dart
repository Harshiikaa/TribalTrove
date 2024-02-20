import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/auth_entity.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel {
  @JsonKey(name: '_id')
  final String? userID;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String? userImage;
  final String password;

  AuthApiModel({
    this.userID,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    this.userImage,
    required this.password,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  // To entity
  factory AuthApiModel.toEntity(AuthApiModel apiModel) {
    return AuthApiModel(
      userID: apiModel.userID,
      firstName: apiModel.firstName,
      lastName: apiModel.lastName,
      email: apiModel.email,
      phoneNumber: apiModel.phoneNumber,
      userImage: apiModel.userImage,
      password: apiModel.password,
    );
  }

  // From entity
  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
      userID: entity.userID,
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      userImage: entity.userImage,
      password: entity.password,
    );
  }
}
