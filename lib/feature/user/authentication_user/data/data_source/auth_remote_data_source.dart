import 'dart:io';

import 'package:TribalTrove/core/networking/http_service.dart';
import 'package:TribalTrove/core/shared_pref/user_shared_prefs.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/constants/api_endpoints.dart';
import '../../../../../core/failure/failure.dart';

import '../../domain/entity/auth_entity.dart';
import '../model/auth_api_model.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>(
  (ref) => AuthRemoteDataSource(
      ref.read(httpServiceProvider), ref.read(userSharedPrefsProvider)),
);

class AuthRemoteDataSource {
  final Dio dio;
    final UserSharedPrefs userSharedPrefs;


  AuthRemoteDataSource(this.dio, this.userSharedPrefs);

  Future<Either<Failure, bool>> registerUser(AuthEntity user) async {
    try {
      AuthApiModel apiModel = AuthApiModel.fromEntity(user);
      Response response = await dio.post(
        ApiEndpoints.register,
        data: {
          "firstName": apiModel.firstName,
          "lastName": apiModel.lastName,
          "email": apiModel.email,
          "phoneNumber": apiModel.phoneNumber,
          "userImage": apiModel.userImage,
          "password": apiModel.password,
        },
      );
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

  
  Future<Either<Failure, bool>> loginUser(
    String email,
    String password,
  ) async {
    try {
      Response response = await dio.post(
        ApiEndpoints.login,
        data: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        String token = response.data["token"];
        Map<String, dynamic> user = response.data["userData"];
        await userSharedPrefs.setUserToken(token);
        await userSharedPrefs.setUser(user);
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }


  Future<Either<Failure, String>> updateProfile(
    String firstName, String lastName,String phoneNumber, String email, File image) async {
  try {
    String? token;
    final data = await userSharedPrefs.getUserToken();
    final userData = await userSharedPrefs.getUser();
    data.fold((l) => token = null, (r) => token = r!);
    String? id = userData?['_id']?.toString() ?? '';

    String fileName = image.path.split('/').last;
    FormData formData = FormData.fromMap(
      {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phoneNumber': phoneNumber,
        'userImage': await MultipartFile.fromFile(
          image.path,
          filename: fileName,
        ),
      },
    );

    var response = await dio.put(
      '${ApiEndpoints.updateProfile}/$id', // Assuming this is your correct API endpoint for updating the profile
      data: formData,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );

    if (response.statusCode == 200) {
      String message = response.data['message'];
      return Right(message);
    } else {
      return Left(
        Failure(
          error: response.data['message'],
          statusCode: response.statusCode.toString(),
        ),
      );
    }
  } on DioError catch (e) {
    print("Failed $e");
    return Left(
      Failure(
        error: e.error.toString(),
        statusCode: e.response?.statusCode.toString() ?? '0',
      ),
    );
  }
}



  Future<Either<Failure, String>> updateUserPassword(String currentPassword,
      String newPassword, String confirmPassword) async {
    try {
      String? token;
      final data = await userSharedPrefs.getUserToken();
      final userData = await userSharedPrefs.getUser();
      data.fold((l) => token = null, (r) => token = r!);
      String? id = userData?['_id']?.toString() ?? '';
      var response = await dio.put(
        '${ApiEndpoints.changePassword}/$id',
        data: {
          "currentPassword": currentPassword,
          "newPassword": newPassword,
          "confirmPassword": confirmPassword
        },
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

     

      if (response.statusCode == 200) {
        String message = response.data['message'];
        return Right(message);
      } else {
        return Left(
          Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
    
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
    
  }

   Future<Either<Failure, String>> forgetPassword(
    String email,
   
  ) async {
    try {
      Response response = await dio.post(ApiEndpoints.forgetPassword, data: {
        "email": email,
      });
      if (response.statusCode == 200) {
        String token = response.data["token"];
        Map<String, dynamic> user = response.data["userData"];
        await userSharedPrefs.setUserToken(token);
        await userSharedPrefs.setUser(user);

        String message = response.data['message'];
        return Right(message);
      } else {
        return Left(
          Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
    
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
    
  }

    // Upload image using multipart
  Future<Either<Failure, String>> uploadProfilePicture(
    File image,
  ) async {
    try {
      String fileName = image.path.split('/').last;
      FormData formData = FormData.fromMap(
        {
          'profilePicture': await MultipartFile.fromFile(
            image.path,
            filename: fileName,
          ),
        },
      );

      Response response = await dio.post(
        ApiEndpoints.uploadImage,
        data: formData,
      );

      return Right(response.data["data"]);
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

}
