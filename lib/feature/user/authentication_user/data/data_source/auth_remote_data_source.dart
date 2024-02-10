import 'dart:io';

import 'package:TribalTrove/core/networking/http_service.dart';
import 'package:TribalTrove/core/shared_pref/user_shared_prefs.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/constants/api_endpoints.dart';
import '../../../../../core/failure/failure.dart';

import '../../domain/entity/auth_entity.dart';
import '../model/auth_api_model.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>(
  (ref) => AuthRemoteDataSource(
      ref.read(httpServiceProvider), ref.read(userSharedPrefsProvider)),
);

class AuthRemoteDataSource {
  final Dio dio;
    final UserSharedPrefs userSharedPrefs;


  AuthRemoteDataSource(this.dio, this.userSharedPrefs);

  Future<Either<Failure, bool>> registerUser(AuthEntity user) async {
    try {
      AuthApiModel apiModel = AuthApiModel.fromEntity(user);
      Response response = await dio.post(
        ApiEndpoints.register,
        data: {
          "firstName": apiModel.firstName,
          "lastName": apiModel.lastName,
          "email": apiModel.email,
          "phoneNumber": apiModel.phoneNumber,
          // "username": apiModel.email,
          "password": apiModel.password,
        },
      );
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

  
  Future<Either<Failure, bool>> loginUser(
    String email,
    String password,
  ) async {
    try {
      Response response = await dio.post(
        ApiEndpoints.login,
        data: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        String token = response.data["token"];
        await userSharedPrefs.setUserToken(token);
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

    // Upload image using multipart
  Future<Either<Failure, String>> uploadProfilePicture(
    File image,
  ) async {
    try {
      String fileName = image.path.split('/').last;
      FormData formData = FormData.fromMap(
        {
          'profilePicture': await MultipartFile.fromFile(
            image.path,
            filename: fileName,
          ),
        },
      );

      Response response = await dio.post(
        ApiEndpoints.uploadImage,
        data: formData,
      );

      return Right(response.data["data"]);
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

}
