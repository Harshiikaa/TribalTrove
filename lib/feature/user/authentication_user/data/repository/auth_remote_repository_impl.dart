import 'dart:io';

import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/user/authentication_user/data/data_source/auth_remote_data_source.dart';
import 'package:TribalTrove/feature/user/authentication_user/domain/entity/auth_entity.dart';
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
    return _authRemoteDataSource.uploadProfilePicture(file);
  }

  @override
  Future<Either<Failure, String>> changePassword(String password, String newPassword, String confirmPassword) async {
    final result= await _authRemoteDataSource.updateUserPassword(password,newPassword, confirmPassword);
    return result.fold((failure)=>Left(failure),(sucess)=> Right(sucess));
  }

    @override
  Future<Either<Failure, String>> changeProfile(String firstName, String lastName, String email,String phoneNumber, File image) async {
    final result= await _authRemoteDataSource.updateProfile(firstName,lastName,email,phoneNumber, image);
    return result.fold((failure)=>Left(failure),(sucess)=> Right(sucess));
  }

    @override
  Future<Either<Failure, String>> forgetPassword(String email) async{
  final result= await _authRemoteDataSource.forgetPassword(email);
  return result.fold((failure)=>Left(failure),(sucess)=> Right(sucess));
  
  }
  

}
