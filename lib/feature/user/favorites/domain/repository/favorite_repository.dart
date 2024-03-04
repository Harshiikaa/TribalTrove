import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/user/favorites/data/repository/favorite_remote_repository.dart';
import 'package:TribalTrove/feature/user/favorites/domain/entity/favorite_entity.dart';
import 'package:TribalTrove/feature/user/favorites/domain/entity/favorites_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteRepositoryProvider = Provider<IFavoriteRepository>(
  (ref) {
    return ref.read(favoriteRemoteRepositoryProvider);
  },
);

abstract class IFavoriteRepository {
  Future<Either<Failure, String>> createFavorite(FavoriteEntity user);
  // Future<Either<Failure, List<FavoriteEntity>>> getFavoriteByUserID();
  Future<Either<Failure, List<FavoritesEntity>>> getFavorite(int page);
  Future<Either<Failure, String>> removeFavorite(FavoriteEntity favoriteEntity);
}
