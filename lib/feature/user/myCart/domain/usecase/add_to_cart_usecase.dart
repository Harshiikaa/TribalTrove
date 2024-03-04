import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/user/myCart/domain/entity/cart_entity.dart';
import 'package:TribalTrove/feature/user/myCart/domain/repository/cart_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addToCartUseCaseProvider = Provider.autoDispose<AddToCartUseCase>(
  (ref) => AddToCartUseCase( ref.watch(cartRepositoryProvider)),
);

class AddToCartUseCase {
  final ICartRepository cartRepository;
  AddToCartUseCase(
     this.cartRepository,
  );

  Future<Either<Failure, bool>> addToCart(CartEntity entity) async {
    return await cartRepository.addToCart(entity);
  }
}
