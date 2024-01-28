import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/auth_entity.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel {
  @JsonKey(name: '_id')
  final String? userId;
  final String firstName;
  final String lastName;
  final String email;
  final String? phoneNumber;
  // final String username;
  final String password;

  AuthApiModel({
    this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phoneNumber,
    // required this.username,
    required this.password,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  // To entity
  factory AuthApiModel.toEntity(AuthApiModel apiModel) {
    return AuthApiModel(
      userId: apiModel.userId,
      firstName: apiModel.firstName,
      lastName: apiModel.lastName,
      email: apiModel.email,
      phoneNumber: apiModel.phoneNumber,
      // username: apiModel.username,
      password: apiModel.password,
    );
  }

  // From entity
  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
      userId: entity.userId,
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      // username: entity.username,
      password: entity.password,
    );
  }
}
