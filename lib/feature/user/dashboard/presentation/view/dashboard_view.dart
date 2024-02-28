import 'package:TribalTrove/feature/user/dashboard/presentation/view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  @override
  Widget build(BuildContext context) {
    final dashboardState = ref.watch(dashboardViewModelProvider);
    return Scaffold(
      body: dashboardState.lstWidgets[dashboardState.index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFFFFFF), // Pure white
        selectedItemColor: Color(0xFF333333), // Dark grey
        unselectedItemColor: Color(0xFF888888), // A shade of grey
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: dashboardState.index,
        onTap: (index) {
          ref.read(dashboardViewModelProvider.notifier).changeIndex(index);
        },
      ),
    );
  }
}
