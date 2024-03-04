import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/user/myCart/domain/entity/cart_entity.dart';
import 'package:TribalTrove/feature/user/myCart/domain/repository/my_cart_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addToCartUseCaseProvider = Provider.autoDispose<AddToCartUseCase>(
  (ref) => AddToCartUseCase(repository: ref.watch(cartRepositoryProvider)),
);

class AddToCartUseCase {
  final ICartRepository repository;
  AddToCartUseCase({
    required this.repository,
  });

  Future<Either<Failure, bool>> addToCart(CartEntity cart) async {
    return await repository.addToCart(cart);
  }
}
