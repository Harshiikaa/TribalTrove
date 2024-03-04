import 'package:TribalTrove/feature/user/dashboard/presentation/view/user/dashboard_view_user.dart';
import 'package:TribalTrove/feature/user/favorites/presentation/view/favorites_view.dart';
import 'package:TribalTrove/feature/user/myCart/presentation/view/cart_view.dart';
import 'package:TribalTrove/feature/user/setting/presentation/view/user_setting_.dart';
import 'package:flutter/material.dart';

class DashboardState {
  final int index;
  final List<Widget> lstWidgets;

  DashboardState({
    required this.index,
    required this.lstWidgets,
  });

  DashboardState.initialState()
      : index = 0,
        lstWidgets = [
          const DashboardViewUser(),
          const FavoritesView(),
          const UserSettingView(),
        ];

  DashboardState copyWith({
    int? index,
  }) {
    return DashboardState(
      index: index ?? this.index,
      lstWidgets: lstWidgets,
    );
  }
}
