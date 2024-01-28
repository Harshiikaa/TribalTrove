import 'package:TribalTrove/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SellerSharedPrefs {
  late SharedPreferences _sharedPreferences;

  Future<Either<Failure, bool>> setSellerToken(String token) async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      await _sharedPreferences.setString('token', token);
      return right(true);
    } catch (e) {
      return left(Failure(error: e.toString()));
    }
  }

  // get seller token
  Future<Either<Failure, String?>> getSellerToken() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      final token = _sharedPreferences.getString('token');
      return right(token);
    } catch (e) {
      return left(Failure(error:e.toString()));
    }
  }

  // delete seller token 
  Future<Either<Failure, bool>> deleteSellerToken() async{
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      await _sharedPreferences.remove('token');
      return right(true);
      
    } catch (e) {
      return left(Failure(error: e.toString()));
      
    }
  }
}

