import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/failure/failure.dart';
import '../../domain/entity/auth_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_local_data_source.dart';

final authLocalRepositoryProvider = Provider.autoDispose<IAuthRepository>(
  (ref) => AuthLocalRepository(ref.read(authLocalDataSourceProvider)),
);

class AuthLocalRepository implements IAuthRepository {
  final AuthLocalDataSource _authLocalDataSource;

  AuthLocalRepository(this._authLocalDataSource);

  @override
  Future<Either<Failure, bool>> loginUser(String email, String password) {
    return _authLocalDataSource.loginUser(email, password);
  }

  @override
  Future<Either<Failure, bool>> registerUser(AuthEntity user) {
    return _authLocalDataSource.registerUser(user);
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) async {
    return const Right("");
  }
  
  @override
  Future<Either<Failure, String>> changePassword(String password, String newPassword, String confirmPassword) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, String>> changeProfile(String firstName, String lastName, String phoneNumber, String email, File image) {
    // TODO: implement changeProfile
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, String>> forgetPassword(String email) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }
}
