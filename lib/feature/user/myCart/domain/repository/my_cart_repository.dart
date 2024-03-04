import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/user/myCart/data/repository/my_cart_remote_repository.dart';
import 'package:TribalTrove/feature/user/myCart/domain/entity/cart_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartRepositoryProvider = Provider.autoDispose<ICartRepository>(
  (ref) {
    return ref.read(cartRemoteRepositoryProvider);
  },
);

abstract class ICartRepository {
  Future<Either<Failure, bool>> addToCart(CartEntity cart);
  Future<Either<Failure, List<CartEntity>>> getCart(int page);
  Future<Either<Failure, bool>> removeFromCart(CartEntity cartEntity);
}
