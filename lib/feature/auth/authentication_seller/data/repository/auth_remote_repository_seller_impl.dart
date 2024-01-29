import 'dart:io';

import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/auth/authentication_seller/data/data_source/auth_remote_data_source_seller.dart';
import 'package:TribalTrove/feature/auth/authentication_seller/domain/entity/auth_entity_seller.dart';
import 'package:TribalTrove/feature/auth/authentication_user/data/data_source/auth_remote_data_source.dart';
import 'package:TribalTrove/feature/auth/authentication_user/domain/entity/auth_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repository/auth_repository_seller.dart';

final authRemoteRepositorySellerProvider = Provider<IAuthRepositorySeller>(
  (ref) => AuthRemoteRepositorySeller(
    ref.read(authRemoteDataSourceSellerProvider),
  ),
);

class AuthRemoteRepositorySeller implements IAuthRepositorySeller{
  final AuthRemoteDataSourceSeller _authRemoteDataSourceSeller;

  AuthRemoteRepositorySeller(this._authRemoteDataSourceSeller);

  @override
  Future<Either<Failure, bool>> loginSeller(String email, String password) async{
        return await _authRemoteDataSourceSeller.loginSeller(email, password);

  }

  @override
  Future<Either<Failure, bool>> registerSeller(AuthEntitySeller seller) async {
    return await _authRemoteDataSourceSeller.registerSeller(seller);
  }

  // @override
  // Future<Either<Failure, String>> uploadProfilePicture(File file) {
  //   // TODO: implement uploadProfilePicture
  //   throw UnimplementedError();
  // }
}
