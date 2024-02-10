
import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/seller/product/domain/entity/product_entity.dart';
import 'package:TribalTrove/feature/seller/product/domain/repository/ProductRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addBatchUsecaseProvider = Provider.autoDispose<CreateProductUsecase>(
  (ref) => CreateProductUsecase(repository: ref.watch(productRepositoryProvider)),
);

class CreateProductUsecase {
  final IProductRepository repository;

  CreateProductUsecase({required this.repository});

  Future<Either<Failure, bool>> createProduct(ProductEntity product) async {
    return await repository.createProduct(product);
  }
}
