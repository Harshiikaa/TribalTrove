import 'package:TribalTrove/feature/auth/authentication_seller/domain/entity/auth_entity_seller.dart';
import 'package:TribalTrove/feature/auth/authentication_seller/domain/repository/auth_repository_seller.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/failure/failure.dart';


final registerUseCaseSellerProvider = Provider.autoDispose<RegisterUseCaseSeller>(
  (ref) => RegisterUseCaseSeller(ref.read(authRepositorySellerProvider)),
);

class RegisterUseCaseSeller {
  final IAuthRepositorySeller _authRepositorySeller;

  RegisterUseCaseSeller(this._authRepositorySeller);

  Future<Either<Failure, bool>> registerSeller(AuthEntitySeller entity) async {
    return await _authRepositorySeller.registerSeller(entity);
  }
}
