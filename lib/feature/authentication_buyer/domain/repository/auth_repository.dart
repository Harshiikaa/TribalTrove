import 'dart:io';

import 'package:TribalTrove/feature/authentication_buyer/data/repository/auth_remote_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../entity/auth_entity.dart';

final authRepositoryProvider = Provider<IAuthRepository>(
  (ref) => ref.read(authSellerRemoteRepositoryProvider),
);

abstract class IAuthRepository {
  Future<Either<Failure, bool>> registerUser(AuthEntity user);
  Future<Either<Failure, bool>> loginUser(String email, String password);
  Future<Either<Failure, String>> uploadProfilePicture(File file);
}
