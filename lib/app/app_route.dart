import 'package:app/view/forgotPass_view.dart';
import 'package:app/view/seller/registerPage(Merchant).dart';
import 'package:app/view/user/homePage_view.dart';
import 'package:app/view/landingPage_view.dart';
import 'package:app/view/loginPage_view.dart';
import 'package:app/view/registerPage_view.dart';

class AppRoute {
  AppRoute._();
  static const String home = "/";
  static const String landingPageRoute = "/landingPage";
  static const String loginPageRoute = "/loginPage";
  static const String registerPageRoute = "/registerPage";
  static const String registerMerchantRoute = "/registerPageMerchant";

  static const String forgotPasswordPageRoute = "/forgotPassPage";

  static getApplication() {
    return {
      home: (context) => const HomePageView(),
      landingPageRoute: (context) => const LandingPageView(),
      loginPageRoute: (context) => const LoginPageView(),
      registerPageRoute: (context) => const RegisterPageView(),
      registerMerchantRoute: (context) => const RegisterPageMerchant(),
      forgotPasswordPageRoute: (context) => const ForgotPasswordPageView(),
    };
  }
}
