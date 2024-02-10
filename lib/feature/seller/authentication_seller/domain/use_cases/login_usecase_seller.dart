import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/seller/authentication_seller/domain/repository/auth_repository_seller.dart';
import 'package:TribalTrove/feature/user/authentication_user/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginUseCaseSellerProvider = Provider.autoDispose<LoginUseCaseSeller>(
  (ref) => LoginUseCaseSeller(ref.watch(authRepositorySellerProvider))

);

class LoginUseCaseSeller{
  final IAuthRepositorySeller _authRepositorySeller;

  LoginUseCaseSeller(this._authRepositorySeller);

  Future<Either<Failure,bool>> loginSeller(
    String  email,
    String password,
  ) async{
    return await _authRepositorySeller.loginSeller(email, password);
  }
}