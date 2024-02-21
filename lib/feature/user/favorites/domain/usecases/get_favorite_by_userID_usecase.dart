import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/user/favorites/data/dto/get_favorites_by_userID_dto.dart';
import 'package:TribalTrove/feature/user/favorites/domain/entity/favorites_entity.dart';
import 'package:TribalTrove/feature/user/favorites/domain/repository/favorite_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final getFavoriteByUserIDUsecaseProvider = Provider.autoDispose<GetFavoriteByUserIDUsecase>(
  (ref) => GetFavoriteByUserIDUsecase(repository: ref.read(favoriteRepositoryProvider)),
);

class GetFavoriteByUserIDUsecase{
  final IFavoriteRepository repository;
  GetFavoriteByUserIDUsecase({required this.repository});

  Future<Either<Failure, List<FavoriteEntity>>> getFavoriteByUserID() async {
    return await repository.getFavoriteByUserID();
  }

}