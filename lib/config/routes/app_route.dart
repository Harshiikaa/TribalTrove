import 'package:TribalTrove/feature/seller/authentication_seller/presentation/view/loginPage_merchant.dart';
import 'package:TribalTrove/feature/seller/product/presentation/view/seller_product_view.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/view/role.dart';
import 'package:TribalTrove/feature/user/dashboard/presentation/view/dashboard_view.dart';
import 'package:TribalTrove/feature/user/dashboard/presentation/view/user/dashboard_view_user.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/view/forgotPass_view.dart';
import 'package:TribalTrove/feature/seller/authentication_seller/presentation/view/registerPage_merchant.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/view/landingPage_view.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/view/loginPage_view.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/view/registerPage_view.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/view/splashScreen_view.dart';
import 'package:TribalTrove/feature/seller/seller_dashboard/presentation/view/seller_dashboard_view.dart';
import 'package:TribalTrove/feature/user/dashboard/presentation/view/user/product_details.dart';
import 'package:TribalTrove/feature/user/myCart/presentation/view/myCart_view.dart';
import 'package:TribalTrove/feature/user/profile/presentation/view/user_profile_view.dart';

class AppRoute {
  AppRoute._();
  static const String landingPageRoute = "/landingPage";
  static const String rolePageRoute = "/rolePage";
  static const String loginPageRoute = "/loginPage";
  static const String registerPageRoute = "/registerPage";
  static const String forgotPasswordPageRoute = "/forgotPassPage";
  static const String splashScreenRoute = "/splashScreen";
  static const String timeAndDateScreenRoute = "/timeAndDateScreen";

  // user
  static const String home = "/";
  static const String userProfile = "/userProfile";
  static const String productDetails = "/productDetails";
  static const String myCart = "/myCart";

  //seller
  static const String loginPageSellerRoute = "/loginPageSeller";
  static const String registerMerchantRoute = "/registerPageMerchant";
  static const String sellerProductsScreenRoute = "/sellerProductsScreen";
  static const String dashboardRoute = "/dashboardSellerScreen";
  static const String sellerDashboardRoute = "/sellerDashboardScreen";

  static getApplication() {
    return {
      landingPageRoute: (context) => const LandingPageView(),
      rolePageRoute: (context) => const Role(),
      loginPageRoute: (context) => const LoginPageView(),
      registerPageRoute: (context) => const RegisterPageView(),
      forgotPasswordPageRoute: (context) => const ForgotPasswordPageView(),
      splashScreenRoute: (context) => const SplashScreen(),

      // user
      home: (context) => const DashboardView(),
      userProfile: (context) => const UserProfileView(),
      productDetails: (context) => const ProductDetailsView(),
      myCart: (context) => const MyCartView(),

      // seller
      loginPageSellerRoute: (context) => const LoginPageSellerView(),
      registerMerchantRoute: (context) => const RegisterPageMerchant(),
      dashboardRoute: (context) => DashboardView(),
      sellerDashboardRoute: (context) => SellerDashboardView(),
      sellerProductsScreenRoute: (context) => SellerProductView(),
    };
  }
}
