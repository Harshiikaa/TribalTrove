import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/user/authentication_user/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final forgetUseCaseProvider = Provider.autoDispose<ForgetPasswordUseCase>(
  (ref) => ForgetPasswordUseCase(ref.watch(authRepositoryProvider)),
);

class ForgetPasswordUseCase {
  final IAuthRepository _authRepository;

  ForgetPasswordUseCase(this._authRepository);

  Future<Either<Failure, String>> forgetPassword(
    String email,
    
  ) async {
    return await _authRepository.forgetPassword(email);
  }
}