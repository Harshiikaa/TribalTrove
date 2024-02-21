
import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/seller/product/data/data_source/product_remote_data_source.dart';
import 'package:TribalTrove/feature/seller/product/domain/entity/product_entity.dart';
import 'package:TribalTrove/feature/seller/product/domain/repository/product_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productRemoteRepositoryProvider = Provider.autoDispose<IProductRepository>(
  (ref) => ProductRemoteRepoImpl(
    productRemoteDataSource: ref.read(productRemoteDatasourceProvider),
  ),
);

class ProductRemoteRepoImpl implements IProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;

  const ProductRemoteRepoImpl({required this.productRemoteDataSource});

  @override
  Future<Either<Failure, bool>> createProduct(ProductEntity product) {
    return productRemoteDataSource.createProduct(product);
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() {
    return productRemoteDataSource.getAllProducts();
  }

  @override
  Future<Either<Failure, bool>> deleteProduct(String productID) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<ProductEntity>>> getProductByCategory(String productCategory) {
    // TODO: implement getProductByCategory
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<ProductEntity>>> getProductBySellerID(String sellerID) {
    // TODO: implement getProductBySellerID
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, bool>> updateProduct(ProductEntity updatedProduct) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
}
