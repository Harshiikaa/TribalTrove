import 'package:TribalTrove/core/networking/http_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/constants/api_endpoints.dart';
import '../../../../core/failure/failure.dart';

import '../../domain/entity/auth_entity.dart';
import '../model/auth_api_model.dart';

final authSellerRemoteDataSourceProvider = Provider<AuthSellerRemoteDataSource>(
  (ref) => AuthSellerRemoteDataSource(
    ref.read(httpServiceProvider),
  ),
);

class AuthSellerRemoteDataSource {
  final Dio dio;

  AuthSellerRemoteDataSource(this.dio);

  Future<Either<Failure, bool>> registerSeller(AuthEntity seller) async {
    try {
      AuthApiModel apiModel = AuthApiModel.fromEntity(seller);
      print(apiModel);
      Response response = await dio.post(
        ApiEndpoints.register,
        data: {
          "firstName": apiModel.firstName,
          "lastName": apiModel.lastName,
          "email": apiModel.email,
          "phoneNumber": apiModel.phone,
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
}
