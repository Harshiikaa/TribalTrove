import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/user/favorites/domain/entity/favorites_entity.dart';
import 'package:TribalTrove/feature/user/favorites/domain/repository/favorite_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createFavoriteUseCaseProvider =
    Provider.autoDispose<CreateFavoriteUseCase>(
  (ref) =>
      CreateFavoriteUseCase(repository: ref.watch(favoriteRepositoryProvider)),
);

class CreateFavoriteUseCase {
  final IFavoriteRepository repository;
  CreateFavoriteUseCase({
    required this.repository,
  });

  Future<Either<Failure, bool>> createFavorite(FavoriteEntity favorite) async {
    return await repository.createFavorite(favorite);
  }
}
