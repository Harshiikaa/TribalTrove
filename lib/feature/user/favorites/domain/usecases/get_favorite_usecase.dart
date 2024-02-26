import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/user/favorites/data/dto/get_favorite_dto.dart';
import 'package:TribalTrove/feature/user/favorites/domain/entity/favorites_entity.dart';
import 'package:TribalTrove/feature/user/favorites/domain/repository/favorite_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getFavoriteUsecaseProvider =
    Provider.autoDispose<GetFavoriteUsecase>(
  (ref) => GetFavoriteUsecase(repository: ref.read(favoriteRepositoryProvider)),
);

class GetFavoriteUsecase {
  final IFavoriteRepository repository;
  GetFavoriteUsecase({required this.repository});

  Future<Either<Failure, List<FavoriteEntity>>> getFavorite(int page) async {
    return await repository.getFavorite(page);
  }
}
