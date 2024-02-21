import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/feature/user/favorites/data/repository/favorite_remote_repository.dart';
import 'package:TribalTrove/feature/user/favorites/domain/entity/favorites_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final favoriteRepositoryProvider = Provider.autoDispose<IFavoriteRepository>(
  (ref){
    return ref.read(favoriteRemoteRepositoryProvider);

  },);
abstract class IFavoriteRepository{
  Future<Either<Failure,bool>> createFavorite(FavoriteEntity  favorite);
    Future<Either<Failure, List<FavoriteEntity>>> getFavoriteByUserID();

  Future<Either<Failure,Unit>> deleteFavorite(String id);

}