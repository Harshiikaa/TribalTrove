import 'package:TribalTrove/config/constants/api_endpoints.dart';
import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/core/networking/http_service.dart';
import 'package:TribalTrove/core/shared_pref/user_shared_prefs.dart';
import 'package:TribalTrove/feature/user/myCart/data/dto/get_cart_dto.dart';
import 'package:TribalTrove/feature/user/myCart/data/model/myCart_api_model.dart';
import 'package:TribalTrove/feature/user/myCart/domain/entity/mycart_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myCartRemoteDataSourceProvider =
    Provider.autoDispose<MyCartRemoteDataSource>(
  (ref) => MyCartRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
  ),
);

class MyCartRemoteDataSource {
  final Dio dio;
  final UserSharedPrefs userSharedPrefs;
  MyCartRemoteDataSource({required this.dio, required this.userSharedPrefs});

  Future<Either<Failure, bool>> addToCart(MyCartEntity myCart) async {
    try {
      String? token;
      final data = await userSharedPrefs.getUserToken();
      data.fold((l) => token = null, (r) => token = r!);
      MyCartAPIModel myCartAPIModel = MyCartAPIModel.fromEntity(myCart);
      // print('Request Data: ${myCartAPIModel.toJson()}');
      var response = await dio.post(ApiEndpoints.addToCart,
          data: myCartAPIModel.toJson(),
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      // print('Response Data: ${response.data}');
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

  // Get all cart
    Future<Either<Failure, List<MyCartEntity>>> getCart(int page) async {
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
        GetCartDTO getCartDTO = GetCartDTO.fromJson(response.data);
        List<MyCartEntity> cartList = getCartDTO.cart
            .map((data) => MyCartAPIModel.toEntity(data))
            .toList();

        return Right(cartList);
      } else {
        return Left(Failure(
          error: response.statusMessage?.toString() ?? 'Unknown Error',
          statusCode: response.statusCode.toString(),
        ));
      }
    } on DioException catch (e) {
      return Left(Failure(error: e.message.toString()));
    }
  }

// removeFromCart
  Future<Either<Failure, bool>> removeFromCart(
      MyCartEntity cartEntity) async {
    try {
      final userTokenEither = await UserSharedPrefs().getUserToken();
      if (userTokenEither.isLeft()) {
        // Handle the failure to get the user token
        return left(userTokenEither.fold(
            (failure) => failure, (_) => Failure(error: '')));
      }

      final userToken = userTokenEither.getOrElse(() => null);

      final response = await dio.delete(
          ApiEndpoints.removeFromCart + cartEntity.myCartID!,
          options: Options(headers: {'Authorization': 'Bearer $userToken'}));

      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(Failure(
          error: response.data["message"],
          statusCode: response.statusCode.toString(),
        ));
      }
    } on DioException catch (e) {
      return Left(Failure(
        error: 'Failed to add feedback: ${e.toString()}',
      ));
    }
  }

}
