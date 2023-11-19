import 'package:TribalTrove/view/dashboard_view.dart';
import 'package:TribalTrove/view/forgotPass_view.dart';
import 'package:TribalTrove/view/seller/registerPage(Merchant).dart';
import 'package:TribalTrove/view/landingPage_view.dart';
import 'package:TribalTrove/view/loginPage_view.dart';
import 'package:TribalTrove/view/registerPage_view.dart';

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
      home: (context) => const DashboardPageUser(),
      landingPageRoute: (context) => const LandingPageView(),
      loginPageRoute: (context) => const LoginPageView(),
      registerPageRoute: (context) => const RegisterPageView(),
      registerMerchantRoute: (context) => const RegisterPageMerchant(),
      forgotPasswordPageRoute: (context) => const ForgotPasswordPageView(),
    };
  }
}
