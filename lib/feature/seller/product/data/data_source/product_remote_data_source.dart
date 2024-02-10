import 'package:TribalTrove/config/constants/api_endpoints.dart';
import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/core/networking/http_service.dart';
import 'package:TribalTrove/feature/seller/product/data/dto/get_all_products_dto.dart';
import 'package:TribalTrove/feature/seller/product/data/model/product_api_model.dart';
import 'package:TribalTrove/feature/seller/product/domain/entity/product_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productRemoteDatasourceProvider =
    Provider.autoDispose<ProductRemoteDataSource>(
  (ref) => ProductRemoteDataSource(
    dio: ref.read(httpServiceProvider),
  ),
);

class ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSource({required this.dio});

  // create Product
  Future<Either<Failure, bool>> createProduct(ProductEntity product) async {
    try {
      ProductAPIModel productAPIModel = ProductAPIModel.fromEntity(product);
      var response = await dio.post(
        ApiEndpoints.createProduct,
        data: productAPIModel.toJson(),
      );
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

  // Get all products
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      var response = await dio.get(ApiEndpoints.getAllProducts);
      if (response.statusCode == 200) {
        GetAllProductsDTO getAllProductsDTO =
            GetAllProductsDTO.fromJson(response.data);
        // Convert ProductsAPIModel to ProductsEntity
        List<ProductEntity> productList = getAllProductsDTO.data
            .map((products) => ProductAPIModel.toEntity(products))
            .toList();

        return Right(productList);
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

  // get all products by seller id
  // complete the function of remaining
}
