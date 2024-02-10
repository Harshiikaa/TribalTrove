import 'package:TribalTrove/config/routes/app_route.dart';
import 'package:TribalTrove/feature/seller/seller_dashboard/presentation/state/seller_dashboard_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sellerDashboardViewModelProvider =
    StateNotifierProvider.autoDispose<SellerDashboardViewModel, SellerDashboardState>(
  (ref) => SellerDashboardViewModel(),
);

class SellerDashboardViewModel extends StateNotifier<SellerDashboardState> {
  SellerDashboardViewModel() : super(SellerDashboardState.initialState());

  void changeIndex(int index) {
    state = state.copyWith(index: index);
  }

  void signOut(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoute.loginPageRoute);
  }
}
