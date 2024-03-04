import 'dart:io';

import 'package:TribalTrove/feature/user/authentication_user/data/repository/auth_remote_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/failure/failure.dart';
import '../../data/repository/auth_local_repository_impl.dart';
import '../entity/auth_entity.dart';

final authRepositoryProvider = Provider<IAuthRepository>(
  (ref) => ref.read(authRemoteRepositoryProvider),
);

abstract class IAuthRepository {
  Future<Either<Failure, bool>> registerUser(AuthEntity user);
  Future<Either<Failure, bool>> loginUser(String email, String password);
  Future<Either<Failure, String>> forgetPassword(String email);
  Future<Either<Failure, String>> changePassword(
      String password, String newPassword, String confirmPassword);
  Future<Either<Failure, String>> changeProfile(
      String firstName, String lastName, String email, File image);
  Future<Either<Failure, String>> uploadProfilePicture(File file);
}
