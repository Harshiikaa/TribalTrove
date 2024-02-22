import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/user/myCart/data/repository/my_cart_remote_repository.dart';
import 'package:TribalTrove/feature/user/myCart/domain/entity/mycart_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final myCartRepositoryProvider = Provider.autoDispose<IMyCartRepository>(
  (ref) {
    return ref.read(myCartRemoteRepositoryProvider);

  }, );
abstract class IMyCartRepository {
  Future<Either<Failure, bool>> addToCart(MyCartEntity cart);
  Future<Either<Failure, List<MyCartEntity>>> getCartByUserID();

  // Future<Either<Failure,Unit>> deleteFavorite(String id);
}
