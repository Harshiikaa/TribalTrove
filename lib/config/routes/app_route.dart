import 'package:TribalTrove/view/admin/dashboard_admin.dart';
import 'package:TribalTrove/view/dashboard_view.dart';
import 'package:TribalTrove/feature/authentication/presentation/view/forgotPass_view.dart';
import 'package:TribalTrove/view/seller/registerPage(Merchant).dart';
import 'package:TribalTrove/feature/authentication/presentation/view/landingPage_view.dart';
import 'package:TribalTrove/feature/authentication/presentation/view/loginPage_view.dart';
import 'package:TribalTrove/feature/authentication/presentation/view/registerPage_view.dart';
import 'package:TribalTrove/feature/authentication/presentation/view/splashScreen_view.dart';
import 'package:TribalTrove/view/user/timeAndDate_view.dart';

class AppRoute {
  AppRoute._();
  static const String home = "/";
  static const String landingPageRoute = "/landingPage";
  static const String loginPageRoute = "/loginPage";
  static const String registerPageRoute = "/registerPage";
  static const String registerMerchantRoute = "/registerPageMerchant";
  static const String forgotPasswordPageRoute = "/forgotPassPage";
  static const String splashScreenRoute = "/splashScreen";
  static const String timeAndDateScreenRoute = "/timeAndDateScreen";
  // static const String dashboardAdminScreenRoute = "/dashboardAdminScreen";

  static getApplication() {
    return {
      home: (context) => const DashboardPageUser(),
      landingPageRoute: (context) => const LandingPageView(),
      loginPageRoute: (context) => const LoginPageView(),
      registerPageRoute: (context) => const RegisterPageView(),
      registerMerchantRoute: (context) => const RegisterPageMerchant(),
      forgotPasswordPageRoute: (context) => const ForgotPasswordPageView(),
      splashScreenRoute: (context) => const SplashScreen(),
      timeAndDateScreenRoute: (context) => const TimeAndDateScreen(),
      // dashboardAdminScreenRoute: (context) => const Dashboard_adminScreen(),
    };
  }
}
