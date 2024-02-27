import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/user/favorites/data/data_source/favorite_remote_data_source.dart';
import 'package:TribalTrove/feature/user/favorites/domain/entity/favorites_entity.dart';
import 'package:TribalTrove/feature/user/favorites/domain/repository/favorite_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteRemoteRepositoryProvider =
    Provider.autoDispose<IFavoriteRepository>((ref) => FavoriteRemoteRepoImpl(
        favoriteRemoteDataSource: ref.read(favoriteRemoteDataSourceProvider)));

class FavoriteRemoteRepoImpl implements IFavoriteRepository {
  final FavoriteRemoteDataSource favoriteRemoteDataSource;

  const FavoriteRemoteRepoImpl({required this.favoriteRemoteDataSource});

  @override
  Future<Either<Failure, bool>> createFavorite(FavoriteEntity favorite) {
    return favoriteRemoteDataSource.createFavorite(favorite);
  }

  
  @override
  Future<Either<Failure, List<FavoriteEntity>>> getFavorite(int page) {
    return favoriteRemoteDataSource.getFavorite(page);
  }
 
  @override
  Future<Either<Failure, bool>> removeFavorite(FavoriteEntity favoriteEntity) {
    return favoriteRemoteDataSource.removeFavorite(favoriteEntity);
  }
  
  
}
