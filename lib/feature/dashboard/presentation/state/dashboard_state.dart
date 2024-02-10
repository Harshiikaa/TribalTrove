import 'package:TribalTrove/feature/categories/presentation/view/categories_view.dart';
import 'package:TribalTrove/feature/dashboard/presentation/view/dashboard_view_user.dart';
import 'package:TribalTrove/feature/dashboard/presentation/view/user/favorites_view.dart';
import 'package:flutter/material.dart';

class DashboardState {
  final int index;
  final List<Widget> listWidgets;

  DashboardState({
    required this.index,
    required this.listWidgets,
  });

  DashboardState.initialState()
      : index = 0,
        listWidgets = [
          DashboardViewUser(),
          CategoriesView(),
          FavoritesView(),
        ];

  DashboardState copyWith({
    int? index,
  }) {
    return DashboardState(
      index: index ?? this.index,
      listWidgets: listWidgets,
    );
  }
}
