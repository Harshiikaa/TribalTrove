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
        print("Product created successfully");
        return const Right(true);
      } else {
        print(
            "Failed to create product. Status Code: ${response.statusCode}, Message: ${response.statusMessage}");
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      print("DioException during createProduct: ${e.message}");
      return Left(Failure(error: e.response?.data['message']));
    }
  }

  // Get all products
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      var response = await dio.get(ApiEndpoints.getAllProducts);
      if (response.statusCode == 200) {
        print("Received data successfully");
        GetAllProductsDTO getAllProductsDTO =
            GetAllProductsDTO.fromJson(response.data);
        print("DTO converted successfully");
        // Convert ProductsAPIModel to ProductsEntity
        List<ProductEntity> productList = getAllProductsDTO.products
            .map((products) => ProductAPIModel.toEntity(products))
            .toList();
        return Right(productList);
      } else {
        print(
            "Failed to get all products. Status Code: ${response.statusCode}, Message: ${response.statusMessage}");
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      print("DioException during getAllProducts: ${e.message}");
      return Left(Failure(error: e.response?.data['message']));
    }
  }

//   Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
//   try {
//     var response = await dio.get(ApiEndpoints.getAllProducts);
//     if (response.statusCode == 200) {
//       print("Received data successfully");
//       GetAllProductsDTO getAllProductsDTO =
//           GetAllProductsDTO.fromJson(response.data);
//       print("DTO converted successfully");
//       // Convert ProductsAPIModel to ProductsEntity
//       List<ProductEntity> productList = getAllProductsDTO.products
//           .map((products) => ProductAPIModel.toEntity(products))
//           .toList();
//       return Right(productList);
//     } else {
//       print(
//           "Failed to get all products. Status Code: ${response.statusCode}, Message: ${response.statusMessage}");
//       return Left(
//         Failure(
//           error: response.statusMessage.toString(),
//           statusCode: response.statusCode.toString(),
//         ),
//       );
//     }
//   } on DioError catch (e) {
//     print("DioError during getAllProducts: ${e.message}");
//     // Handle DioError as needed
//     return Left(Failure(error: e.response?.data['message']));
//   } on DioException catch (e) {
//     print("DioException during getAllProducts: ${e.message}");
//     // Handle DioException as needed
//     return Left(Failure(error: "Gehieh"));
//   }
// }



}
