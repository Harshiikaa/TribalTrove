import 'package:TribalTrove/config/routes/app_route.dart';
import 'package:TribalTrove/core/shared_pref/user_shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';


final splashViewModelProvider = StateNotifierProvider<SplashViewModel, void>(
  (ref) {
    return SplashViewModel(
      ref.read(userSharedPrefsProvider),
    );
  },
);

class SplashViewModel extends StateNotifier<void>{
    final UserSharedPrefs userSharedPrefs;

  SplashViewModel(this.userSharedPrefs): super(null);

   init(BuildContext context) async {
    final data = await userSharedPrefs.getUserToken();

    data.fold((l) => null, (token) {
      if (token != null) {
        bool isTokenExpired = isValidToken(token);
        if (isTokenExpired) {
          Navigator.popAndPushNamed(context, AppRoute.loginPageRoute);
        } else {
          Navigator.popAndPushNamed(context, AppRoute.home);
        }
      } else {
        Navigator.popAndPushNamed(context, AppRoute.loginPageRoute);
      }
    });
  }

    bool isValidToken(String token) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

  // 10 digit
    int expirationTimestamp = decodedToken['exp'];
  // 13 
    final currentDate = DateTime.now().millisecondsSinceEpoch;
    // If current date is greater than expiration timestamp then token is expired
    return currentDate > expirationTimestamp * 1000;
  }


}