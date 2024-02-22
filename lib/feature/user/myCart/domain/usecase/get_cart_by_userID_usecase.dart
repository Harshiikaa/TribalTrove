
import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/user/myCart/domain/entity/mycart_entity.dart';
import 'package:TribalTrove/feature/user/myCart/domain/repository/my_cart_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCartByUserIDUsecaseProvider = Provider.autoDispose<GetCartByUserIDUsecase>(
  (ref) => GetCartByUserIDUsecase(repository: ref.read(myCartRepositoryProvider)),
);

class GetCartByUserIDUsecase{
  final IMyCartRepository repository;
  GetCartByUserIDUsecase({required this.repository});

  Future<Either<Failure, List<MyCartEntity>>> getCartByUserID() async {
    return await repository.getCartByUserID();
  }

}