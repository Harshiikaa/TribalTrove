import 'package:TribalTrove/config/constants/api_endpoints.dart';
import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/core/networking/http_service.dart';
import 'package:TribalTrove/core/shared_pref/user_shared_prefs.dart';
import 'package:TribalTrove/feature/user/myCart/data/dto/get_cart_by_userID_dto.dart';
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

  // Get all favorites
  Future<Either<Failure, List<MyCartEntity>>> getCartByUserID() async {
    try {
      // int id = await userSharedPrefs.getUser();
      var response = await dio.get(ApiEndpoints.getCartByUserID);
      if (response.statusCode == 200) {
        GetCartByUserIDDTO getCartByUserIDDTO =
            GetCartByUserIDDTO.fromJson(response.data);
        // Convert MyCartAPIModel to MyCartEntity
        List<MyCartEntity> cartList = getCartByUserIDDTO.cart
            .map((cart) => MyCartAPIModel.toEntity(cart))
            .toList();
        return Right(cartList);
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
