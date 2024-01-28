import 'package:TribalTrove/config/constants/hive_table_constant.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entity/auth_entity.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.userTableId)
class AuthHiveModel {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String firstName;

  @HiveField(2)
  final String lastName;

  @HiveField(3)
  final String email;

  @HiveField(4)
  final String phoneNumber;

  // @HiveField(5)
  // final String username;

  @HiveField(5)
  final String password;

  // Constructor
  AuthHiveModel({
    String? userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    // required this.username,
    required this.password,
  }) : userId = userId ?? const Uuid().v4();

  // // empty constructor
  AuthHiveModel.empty()
      : this(
          userId: '',
          firstName: '',
          lastName: '',
          email: '',
          phoneNumber: '',
          // username: '',
          password: '',
        );

  // Convert Entity to Hive Object
  factory AuthHiveModel.toHiveModel(AuthEntity entity) => AuthHiveModel(
        firstName: entity.firstName,
        lastName: entity.lastName,
        email: entity.email,
        phoneNumber: entity.phoneNumber,
        // username: entity.username,
        password: entity.password,
      );

  // Convert Hive Object to Entity
  static AuthEntity toEntity(AuthHiveModel hiveModel) => AuthEntity(
        userId: hiveModel.userId,
        firstName: hiveModel.firstName,
        lastName: hiveModel.lastName,
        email: hiveModel.email,
        phoneNumber: hiveModel.phoneNumber,
        // username: hiveModel.username,
        password: hiveModel.password,
      );

  @override
  String toString() {
    return 'userId: $userId, firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber, password: $password';
  }

  @override
  List<Object?> get props =>
      [userId, firstName, lastName, email, phoneNumber, password];
}
