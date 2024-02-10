import 'package:TribalTrove/feature/user/dashboard/presentation/view/dashboard_view_user.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/view/forgotPass_view.dart';
import 'package:TribalTrove/feature/seller/authentication_seller/presentation/view/registerPage_merchant.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/view/landingPage_view.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/view/loginPage_view.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/view/registerPage_view.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/view/splashScreen_view.dart';
import 'package:TribalTrove/feature/user/dashboard/presentation/view/user/timeAndDate_view.dart';
import 'package:TribalTrove/feature/seller/product/presentation/view/seller_products_view.dart';
import 'package:TribalTrove/feature/seller/seller_dashboard/presentation/view/seller_dashboard_view.dart';

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
  static const String sellerProductsScreenRoute = "/sellerProductsScreen";
  static const String sellerDashboardRoute = "/sellerDashboardScreen";

  static getApplication() {
    return {
      home: (context) => const DashboardViewUser(),
      landingPageRoute: (context) => const LandingPageView(),
      loginPageRoute: (context) => const LoginPageView(),
      registerPageRoute: (context) => const RegisterPageView(),
      registerMerchantRoute: (context) => const RegisterPageMerchant(),
      forgotPasswordPageRoute: (context) => const ForgotPasswordPageView(),
      splashScreenRoute: (context) => const SplashScreen(),
      timeAndDateScreenRoute: (context) => const TimeAndDateScreen(),
      sellerProductsScreenRoute: (context) => SellerProductsView(),
      sellerDashboardRoute: (context) => SellerDashboardView(),
    };
  }
}
