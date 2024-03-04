import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/user/myCart/data/data_source/cart_remote_data_source.dart';
import 'package:TribalTrove/feature/user/myCart/data/dto/get_cart_dto.dart';
import 'package:TribalTrove/feature/user/myCart/domain/entity/cart_entity.dart';
import 'package:TribalTrove/feature/user/myCart/domain/repository/my_cart_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartRemoteRepositoryProvider = Provider.autoDispose<ICartRepository>(
    (ref) => CartRemoteRepoImpl(
        cartRemoteDataSource: ref.read(cartRemoteDataSourceProvider)));

class CartRemoteRepoImpl implements ICartRepository {
  final CartRemoteDataSource cartRemoteDataSource;

  const CartRemoteRepoImpl({required this.cartRemoteDataSource});

  @override
  Future<Either<Failure, bool>> addToCart(CartEntity cart) {
    return cartRemoteDataSource.addToCart(cart);
  }

  @override
  Future<Either<Failure, List<CartEntity>>> getCart(int page) {
    return cartRemoteDataSource.getCart(page);
  }

  @override
  Future<Either<Failure, bool>> removeFromCart(CartEntity cartEntity) {
    return cartRemoteDataSource.removeFromCart(cartEntity);
  }
}
