import 'package:TribalTrove/config/constants/api_endpoints.dart';
import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/core/networking/http_service.dart';
import 'package:TribalTrove/core/shared_pref/user_shared_prefs.dart';
import 'package:TribalTrove/feature/seller/product/data/data_source/product_remote_data_source.dart';
import 'package:TribalTrove/feature/user/favorites/data/dto/get_favorites_by_userID_dto.dart';
import 'package:TribalTrove/feature/user/favorites/data/model/favorite_api_model.dart';
import 'package:TribalTrove/feature/user/favorites/domain/entity/favorites_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteRemoteDataSourceProvider =
    Provider.autoDispose<FavoriteRemoteDataSource>(
  (ref) => FavoriteRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
  ),
);

class FavoriteRemoteDataSource {
  final Dio dio;
  final UserSharedPrefs userSharedPrefs;
  FavoriteRemoteDataSource({required this.dio, required this.userSharedPrefs});

  Future<Either<Failure, bool>> createFavorite(FavoriteEntity favorite) async {
    try {
      String? token;
      final data = await userSharedPrefs.getUserToken();
      data.fold((l) => token = null, (r) => token = r!);
      FavoriteAPIModel favoriteAPIModel = FavoriteAPIModel.fromEntity(favorite);
      var response = await dio.post(ApiEndpoints.createFavorite,
          data: favoriteAPIModel.toJson(),
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      if (response.statusCode == 201) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(Failure(error: e.response?.data['message']));
    }
  }

  // Get all favorites
  Future<Either<Failure, List<FavoriteEntity>>> getFavoriteByUserID() async {
    try {
      // int id = await userSharedPrefs.getUser();
      var response = await dio.get(ApiEndpoints.getFavoriteByUserID);
      if (response.statusCode == 200) {
        GetFavoritesByUserIDDTO getFavoritesByUserIDDTO =
            GetFavoritesByUserIDDTO.fromJson(response.data);
        // Convert FavoriteAPIModel to FavoriteEntity
        List<FavoriteEntity> favoriteList = getFavoritesByUserIDDTO.favorites
            .map((favorites) => FavoriteAPIModel.toEntity(favorites))
            .toList();
        return Right(favoriteList);
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(Failure(error: e.response?.data['message']));
    }
  }
}
