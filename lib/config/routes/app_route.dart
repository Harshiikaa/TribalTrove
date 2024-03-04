import 'package:TribalTrove/feature/seller/authentication_seller/presentation/view/loginPage_merchant.dart';
import 'package:TribalTrove/feature/seller/product/presentation/view/seller_product_view.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/view/role.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/view/updatePassword_view.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/view/updateProfile_view.dart';
import 'package:TribalTrove/feature/user/dashboard/presentation/view/dashboard_view.dart';
import 'package:TribalTrove/feature/user/dashboard/presentation/view/user/categories_page/jewelry.dart';
import 'package:TribalTrove/feature/user/dashboard/presentation/view/user/dashboard_view_user.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/view/forgotPass_view.dart';
import 'package:TribalTrove/feature/seller/authentication_seller/presentation/view/registerPage_merchant.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/view/landingPage_view.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/view/loginPage_view.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/view/registerPage_view.dart';
import 'package:TribalTrove/feature/seller/seller_dashboard/presentation/view/seller_dashboard_view.dart';
import 'package:TribalTrove/feature/user/dashboard/presentation/view/user/product_details.dart';
import 'package:TribalTrove/feature/user/myCart/presentation/view/cart_view.dart';
import 'package:TribalTrove/feature/user/setting/presentation/view/user_setting_.dart';
import 'package:TribalTrove/feature/user/splash_screen/presentation/view/splash_screen.dart';

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
  static const String jewelry = "/jewelry";
  static const String updateProfileRoute = "/updateProfile";
  static const String updatePasswordRoute = "/updatePassword";

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
      splashScreenRoute: (context) => const SplashScreenView(),

      // user
      home: (context) => const DashboardView(),
      userProfile: (context) => const UserSettingView(),
      productDetails: (context) => const ProductDetailsView(),
      myCart: (context) => const CartView(),
      jewelry: (context) => const Jewelry(),
      updateProfileRoute: (context) => const UpdateProfile(),
      updatePasswordRoute: (context) => const UpdatePasswordView(),

      // seller
      loginPageSellerRoute: (context) => const LoginPageSellerView(),
      registerMerchantRoute: (context) => const RegisterPageMerchant(),
      dashboardRoute: (context) => DashboardView(),
      sellerDashboardRoute: (context) => SellerDashboardView(),
      sellerProductsScreenRoute: (context) => SellerProductView(),
    };
  }
}
