import 'dart:io';

import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/authentication/data/data_source/auth_remote_data_source.dart';
import 'package:TribalTrove/feature/authentication/domain/entity/auth_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repository/auth_repository.dart';

final authRemoteRepositoryProvider = Provider<IAuthRepository>(
  (ref) => AuthRemoteRepository(
    ref.read(authRemoteDataSourceProvider),
  ),
);

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRemoteRepository(this._authRemoteDataSource);

  @override
  Future<Either<Failure, bool>> loginUser(String email, String password) async{
        return await _authRemoteDataSource.loginUser(email, password);

  }

  @override
  Future<Either<Failure, bool>> registerUser(AuthEntity user) async {
    return await _authRemoteDataSource.registerUser(user);
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) {
    // TODO: implement uploadProfilePicture
    throw UnimplementedError();
  }
}
