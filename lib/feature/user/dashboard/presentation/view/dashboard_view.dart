import 'package:TribalTrove/feature/user/dashboard/presentation/view/user/dashboard_view_user.dart';
import 'package:TribalTrove/feature/user/dashboard/presentation/view_model/dashboard_view_model.dart';
import 'package:TribalTrove/feature/user/favorites/presentation/view/favorites_view.dart';
import 'package:TribalTrove/feature/user/setting/presentation/view/user_setting_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  int selectedIndex = 0;
  bool isDarkMode = false;

  List<Widget> lstScreen = [
    const DashboardViewUser(),
    const FavoritesView(),
    const UserSettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    // final dashboardState = ref.watch(dashboardViewModelProvider);
    return Scaffold(
      body: lstScreen[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true, // Set the background color here
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
        currentIndex: selectedIndex,
        onTap: (index) {
          // ref.read(dashboardViewModelProvider.notifier).changeIndex(index);
          setState(() {
            selectedIndex = index;
          });
        },
        selectedItemColor: isDarkMode
            ? Color.fromARGB(255, 53, 51, 51)
            : Color.fromARGB(255, 47, 52, 47),
        unselectedItemColor:
            isDarkMode ? Colors.white : Color.fromARGB(255, 164, 163, 163),
        backgroundColor: isDarkMode
            ? Colors.black
            : const Color.fromARGB(255, 106, 103, 103),
      ),
    );
  }
}
