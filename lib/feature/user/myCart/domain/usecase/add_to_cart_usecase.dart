import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/user/myCart/domain/entity/mycart_entity.dart';
import 'package:TribalTrove/feature/user/myCart/domain/repository/my_cart_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addToCartUseCaseProvider =
    Provider.autoDispose<AddToCartUseCase>(
  (ref) =>
      AddToCartUseCase(repository: ref.watch(myCartRepositoryProvider)),
);

class AddToCartUseCase {
  final IMyCartRepository repository;
  AddToCartUseCase({
    required this.repository,
  });

  Future<Either<Failure, bool>> addToCart(MyCartEntity cart) async {
    return await repository.addToCart(cart);
  }
}
