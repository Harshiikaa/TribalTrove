import 'dart:io';

import 'package:TribalTrove/feature/auth/authentication_seller/data/repository/auth_remote_repository_seller_impl.dart';
import 'package:TribalTrove/feature/auth/authentication_seller/domain/entity/auth_entity_seller.dart';
import 'package:TribalTrove/feature/auth/authentication_user/data/repository/auth_remote_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/failure/failure.dart';


final authRepositorySellerProvider = Provider<IAuthRepositorySeller>(
  (ref) => ref.read(authRemoteRepositorySellerProvider),
);

abstract class IAuthRepositorySeller {
  Future<Either<Failure, bool>> registerSeller(AuthEntitySeller seller);
  Future<Either<Failure, bool>> loginSeller(String email, String password);
  // Future<Either<Failure, String>> uploadProfilePicture(File file);
}
