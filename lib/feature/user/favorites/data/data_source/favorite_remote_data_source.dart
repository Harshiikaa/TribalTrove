import 'package:TribalTrove/config/constants/api_endpoints.dart';
import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/core/networking/http_service.dart';
import 'package:TribalTrove/core/shared_pref/user_shared_prefs.dart';
import 'package:TribalTrove/feature/seller/product/data/data_source/product_remote_data_source.dart';
import 'package:TribalTrove/feature/user/favorites/data/dto/get_favorite_dto.dart';
import 'package:TribalTrove/feature/user/favorites/data/model/favorite_api_model.dart';
import 'package:TribalTrove/feature/user/favorites/data/model/favorites_api_model.dart';
import 'package:TribalTrove/feature/user/favorites/domain/entity/favorite_entity.dart';
import 'package:TribalTrove/feature/user/favorites/domain/entity/favorites_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteRemoteDataSourceProvider = Provider<FavoriteRemoteDataSource>(
  (ref) => FavoriteRemoteDataSource(
    ref.read(httpServiceProvider),
    ref.read(userSharedPrefsProvider),
  ),
);

class FavoriteRemoteDataSource {
  final Dio dio;
  final UserSharedPrefs userSharedPrefs;
  FavoriteRemoteDataSource(this.dio, this.userSharedPrefs);

  // Future<Either<Failure, bool>> createFavorite(FavoriteEntity favorite) async {
  //   try {
  //     String? token;
  //     final data = await userSharedPrefs.getUserToken();
  //     data.fold((l) => token = null, (r) => token = r!);
  //     FavoriteAPIModel favoriteAPIModel = FavoriteAPIModel.fromEntity(favorite);
  //     var response = await dio.post(ApiEndpoints.createFavorite,
  //         data: favoriteAPIModel.toJsonForApi(),
  //         options: Options(headers: {'Authorization': 'Bearer $token'}));
  //     if (response.statusCode == 201) {
  //       return const Right(true);
  //     } else {
  //       return Left(
  //         Failure(
  //           error: response.statusMessage.toString(),
  //           statusCode: response.statusCode.toString(),
  //         ),
  //       );
  //     }
  //   } on DioException catch (e) {
  //     return Left(Failure(error: e.response?.data['message']));
  //   }
  // }

  Future<Either<Failure, String>> createFavorite(
      FavoriteEntity favorite) async {
    try {
      String? token;
      final data = await userSharedPrefs.getUserToken();
      data.fold((l) => token = null, (r) => token = r!);
      FavoriteAPIModel favoriteAPIModel = FavoriteAPIModel.fromEntity(favorite);
      var response = await dio.post(ApiEndpoints.createFavorite,
          data: favoriteAPIModel.toJson(),
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      if (response.statusCode == 200) {
        String message = response.data['message'];
        return Right(message);
      } else {
        return Left(
          Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left( Failure(
        error: e.error.toString(),
        statusCode: e.response?.statusCode.toString() ?? '0',
      ),);
    }
  }

  // Future<Either<Failure, List<FavoritesEntity>>> getFavorite(int page) async {
  //   try {
  //     final userData = await userSharedPrefs.getUser();
  //     if (userData == null || userData['_id'] == null) {
  //       print('User data or user ID is null');
  //       return Left(Failure(error: 'User data or user ID is null'));
  //     }

  //     String id = userData['_id'].toString();
  //     final url = 'favorite/getFavorite/$id';
  //     print('Requesting data from: $url');

  //     final response = await dio.get(url, queryParameters: {
  //       '_page': page,
  //       '_limit': ApiEndpoints.limitPage,
  //     });

  //     if (response.statusCode == 200) {
  //       print('Data received successfully');

  //       GetFavoriteDTO getFavoriteDTO = GetFavoriteDTO.fromJson(response.data);
  //       List<FavoritesEntity> favoriteList = getFavoriteDTO.favorites
  //           .map((data) => FavoritesAPIModel.toEntity(data))
  //           .toList();

  //       return Right(favoriteList);
  //     } else {
  //       // print('Failed to get data. Status Code: ${response.statusCode}');

  //       return Left(Failure(
  //         error: response.statusMessage?.toString() ?? 'Unknown Error',
  //         statusCode: response.statusCode.toString(),
  //       ));
  //     }
  //   } on DioException catch (e) {
  //     // print('DioException: ${e.message}');
  //     return Left(Failure(error: e.message.toString()));
  //   }
  // }

  Future<Either<Failure, List<FavoritesEntity>>> getFavorite(int page) async {
  try {
    final userData = await userSharedPrefs.getUser();
    if (userData == null || userData['_id'] == null) {
      print('User data or user ID is null');
      return Left(Failure(error: 'User data or user ID is null'));
    }
    String id = userData['_id'].toString();
    final url = 'favorite/getFavorite/$id';
    print('Requesting data from: $url');
    final response = await dio.get(url, queryParameters: {
      '_page': page,
      '_limit': ApiEndpoints.limitPage,
    });

    if (response.statusCode == 200) {
      print('Data received successfully');

      // Print the raw response data
      print('Raw response data: ${response.data}');

      GetFavoriteDTO getFavoriteDTO = GetFavoriteDTO.fromJson(response.data);
      print('DTO converted successfully');

      // Print the converted DTO
      print('Converted DTO: $getFavoriteDTO');

      List<FavoritesEntity> favoriteList = getFavoriteDTO.favorites
          .map((data) => FavoritesAPIModel.toEntity(data))
          .toList();

      // Print the list of entities
      print('List of entities: $favoriteList');

      return Right(favoriteList);
    } else {
      // Print the error message if status code is not 200
      print('Failed to get data. Status Code: ${response.statusCode}, Message: ${response.statusMessage}');

      return Left(Failure(
        error: response.statusMessage?.toString() ?? 'Unknown Error',
        statusCode: response.statusCode.toString(),
      ));
    }
  } on DioException catch (e) {
    // Print the DioException message
    print('DioException: ${e.message}');
    return Left(Failure(error: e.message.toString()));
  }
}


  // delete favorite
  Future<Either<Failure, String>> removeFavorite(
      FavoriteEntity favoriteEntity) async {
    try {
      final userTokenEither = await UserSharedPrefs().getUserToken();
      if (userTokenEither.isLeft()) {
        // Handle the failure to get the user token
        return left(userTokenEither.fold(
            (failure) => failure, (_) => Failure(error: '')));
      }

      final userToken = userTokenEither.getOrElse(() => null);

      final response = await dio.delete(
          ApiEndpoints.removeFavorite + favoriteEntity.favoriteID!,
          options: Options(headers: {'Authorization': 'Bearer $userToken'}));

      if (response.statusCode == 200) {
        String message = response.data['message'];
      return Right(message);
      } else {
        return Left(Failure(
          error: response.data["message"],
          statusCode: response.statusCode.toString(),
        ));
      }
    } on DioException catch (e) {
      return Left(Failure(
        error: e.error.toString(),
        statusCode: e.response?.statusCode.toString() ?? '0',
      ),);
    }
  }
}
