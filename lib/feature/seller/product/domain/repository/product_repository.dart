import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/seller/product/data/repository/product_remote_repo_impl.dart';
import 'package:TribalTrove/feature/seller/product/domain/entity/product_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productRepositoryProvider = Provider.autoDispose<IProductRepository>(
  (ref) {
    return ref.read(productRemoteRepositoryProvider);
  },
);

abstract class IProductRepository {
  Future<Either<Failure, bool>> createProduct(ProductEntity product);
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
  Future<Either<Failure, List<ProductEntity>>> getProductBySellerID(
      String sellerID);
  Future<Either<Failure, List<ProductEntity>>> getProductByCategory(
      String productCategory);
  Future<Either<Failure, bool>> updateProduct(ProductEntity updatedProduct);
  Future<Either<Failure, bool>> deleteProduct(String productID);
}
