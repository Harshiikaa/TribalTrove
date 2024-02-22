
import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/user/myCart/data/data_source/myCart_remote_data_source.dart';
import 'package:TribalTrove/feature/user/myCart/data/dto/get_cart_by_userID_dto.dart';
import 'package:TribalTrove/feature/user/myCart/domain/entity/mycart_entity.dart';
import 'package:TribalTrove/feature/user/myCart/domain/repository/my_cart_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myCartRemoteRepositoryProvider =
    Provider.autoDispose<IMyCartRepository>((ref) => MyCartRemoteRepoImpl(
        myCartRemoteDataSource: ref.read(myCartRemoteDataSourceProvider)));

class MyCartRemoteRepoImpl implements IMyCartRepository {
  final MyCartRemoteDataSource myCartRemoteDataSource;

  const MyCartRemoteRepoImpl({required this.myCartRemoteDataSource});

  @override
  Future<Either<Failure, bool>> addToCart(MyCartEntity cart) {
    return myCartRemoteDataSource.addToCart(cart);
  }

  // @override
  // Future<Either<Failure, Unit>> getCartByUserID(String id) {
  //   throw UnimplementedError();
  // }
  
  @override
  Future<Either<Failure, List<MyCartEntity>>> getCartByUserID() {
       return myCartRemoteDataSource.getCartByUserID();

  }
}
