import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/user/favorites/domain/entity/favorite_entity.dart';
import 'package:TribalTrove/feature/user/favorites/domain/repository/favorite_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createFavoriteUseCaseProvider =
    Provider.autoDispose<CreateFavoriteUseCase>(
  (ref) =>
      CreateFavoriteUseCase( ref.read(favoriteRepositoryProvider)),
);

class CreateFavoriteUseCase {
  final IFavoriteRepository favoriteRepository;
  CreateFavoriteUseCase(
    this.favoriteRepository,
  );

  Future<Either<Failure, String>> createFavorite(FavoriteEntity entity) async {
    return await favoriteRepository.createFavorite(entity);
  }
}
