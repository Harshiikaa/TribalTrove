import 'package:TribalTrove/config/routes/app_route.dart';
import 'package:TribalTrove/feature/user/dashboard/presentation/state/dashboard_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardViewModelProvider =
    StateNotifierProvider.autoDispose<DashboardViewModel, DashboardState>(
        (ref) => DashboardViewModel());

class DashboardViewModel extends StateNotifier<DashboardState> {
  DashboardViewModel() : super(DashboardState.initialState());

  void changeIndex(int index) {
    state = state.copyWith(index: index);
  }

  // void signOut(BuildContext context) {
  //   Navigator.pushReplacementNamed(context, AppRoute.loginPageRoute);
  // }
}
