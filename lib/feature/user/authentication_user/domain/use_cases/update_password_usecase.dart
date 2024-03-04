import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/user/authentication_user/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updatePasswordUseCaseProvider = Provider.autoDispose<UpdatePasswordUseCase>(
    (ref) => UpdatePasswordUseCase(repository: ref.read(authRepositoryProvider)));

class UpdatePasswordUseCase{
   final IAuthRepository repository;

  UpdatePasswordUseCase({required this.repository});
    Future<Either<Failure, String>> updateUserPassword(
      String currentPassword, String newPassword,  String confirmPassword ) async {
    return await repository.changePassword(currentPassword, newPassword, confirmPassword);
  }
}