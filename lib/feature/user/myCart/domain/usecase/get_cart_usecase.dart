import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/user/myCart/domain/entity/mycart_entity.dart';
import 'package:TribalTrove/feature/user/myCart/domain/repository/my_cart_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCartUsecaseProvider = Provider.autoDispose<GetCartUsecase>(
  (ref) => GetCartUsecase(repository: ref.read(myCartRepositoryProvider)),
);

class GetCartUsecase {
  final IMyCartRepository repository;
  GetCartUsecase({required this.repository});

  Future<Either<Failure, List<MyCartEntity>>> getCart(int page) async {
    return await repository.getCart(page);
  }
}
