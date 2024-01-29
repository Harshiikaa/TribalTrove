import 'package:TribalTrove/core/networking/http_service.dart';
import 'package:TribalTrove/core/shared_pref/seller_shared_prefs.dart';
import 'package:TribalTrove/core/shared_pref/user_shared_prefs.dart';
import 'package:TribalTrove/feature/auth/authentication_seller/data/model/auth_api_model_seller.dart';
import 'package:TribalTrove/feature/auth/authentication_seller/domain/entity/auth_entity_seller.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/constants/api_endpoints.dart';
import '../../../../../core/failure/failure.dart';

final authRemoteDataSourceSellerProvider = Provider<AuthRemoteDataSourceSeller>(
  (ref) => AuthRemoteDataSourceSeller(
      ref.read(httpServiceProvider), ref.read(sellerSharedPrefsProvider)),
);

class AuthRemoteDataSourceSeller {
  final Dio dio;
  final SellerSharedPrefs sellerSharedPrefs;

  AuthRemoteDataSourceSeller(this.dio, this.sellerSharedPrefs);

  Future<Either<Failure, bool>> registerSeller(AuthEntitySeller seller) async {
    try {
      AuthApiModelSeller apiModel = AuthApiModelSeller.fromEntity(seller);
      Response response = await dio.post(
        ApiEndpoints.register,
        data: {
          "businessName": apiModel.businessName,
          "businessPhone": apiModel.businessPhone,
          "businessAddress": apiModel.businessAddress,
          "email": apiModel.email,
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

  Future<Either<Failure, bool>> loginSeller(
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
        await sellerSharedPrefs.setSellerToken(token);
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
