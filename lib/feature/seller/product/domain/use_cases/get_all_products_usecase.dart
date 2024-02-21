import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/seller/product/domain/entity/product_entity.dart';
import 'package:TribalTrove/feature/seller/product/domain/repository/product_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAllProductsUsecaseProvider = Provider.autoDispose<GetAllProductsUsecase>(
  (ref) => GetAllProductsUsecase(repository: ref.read(productRepositoryProvider)),
);

class GetAllProductsUsecase {
  final IProductRepository repository;

  GetAllProductsUsecase({required this.repository});

  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    return await repository.getAllProducts();
  }
}
