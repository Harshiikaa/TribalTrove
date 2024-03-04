import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/user/myCart/domain/entity/cart_entity.dart';
import 'package:TribalTrove/feature/user/myCart/domain/entity/carts_entity.dart';
import 'package:TribalTrove/feature/user/myCart/domain/repository/cart_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCartUsecaseProvider = Provider.autoDispose<GetCartUsecase>(
  (ref) => GetCartUsecase(repository: ref.read(cartRepositoryProvider)),
);

class GetCartUsecase {
  final ICartRepository repository;
  GetCartUsecase({required this.repository});

  Future<Either<Failure, List<CartsEntity>>> getCart(int page) async {
    return await repository.getCart(page);
  }
}
