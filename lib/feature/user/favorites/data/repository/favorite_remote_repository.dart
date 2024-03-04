import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/user/favorites/data/data_source/favorite_remote_data_source.dart';
import 'package:TribalTrove/feature/user/favorites/domain/entity/favorite_entity.dart';
import 'package:TribalTrove/feature/user/favorites/domain/entity/favorites_entity.dart';
import 'package:TribalTrove/feature/user/favorites/domain/repository/favorite_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteRemoteRepositoryProvider =
    Provider<IFavoriteRepository>((ref) => FavoriteRemoteRepoImpl(
        ref.read(favoriteRemoteDataSourceProvider)));

class FavoriteRemoteRepoImpl implements IFavoriteRepository {
  final FavoriteRemoteDataSource favoriteRemoteDataSource;

  FavoriteRemoteRepoImpl(this.favoriteRemoteDataSource);

  @override
  Future<Either<Failure, String>> createFavorite(FavoriteEntity user) async{
      final result= await favoriteRemoteDataSource.createFavorite(user);
    return result.fold((failure)=>Left(failure),(sucess)=> Right(sucess));
  }

  
  @override
  Future<Either<Failure, List<FavoritesEntity>>> getFavorite(int page) {
    return favoriteRemoteDataSource.getFavorite(page);
  }
 
  @override
  Future<Either<Failure, String>> removeFavorite(FavoriteEntity favoriteEntity) async{
   final result= await favoriteRemoteDataSource.removeFavorite(favoriteEntity);
    return result.fold((failure)=>Left(failure),(sucess)=> Right(sucess));
  }
  
  
}
