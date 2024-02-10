// import 'package:TribalTrove/feature/dashboard/presentation/state/dashboard_state.dart';
// import 'package:flutter/material.dart';

// class BottomNavigationWidget extends StatefulWidget {
//   const BottomNavigationWidget({super.key});

//   @override
//   State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
// }

// class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
//    int _selectedIndex = 0;
//    void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//             backgroundColor: Color(0xffEFF2F4),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.category),
//             label: 'Categories',
//             backgroundColor: Color(0xffEFF2F4),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Favorites',
//             backgroundColor: Color(0xffEFF2F4),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.wallet_giftcard),
//             label: 'My Orders',
//             backgroundColor: Color(0xffEFF2F4),
//           ),
//           // BottomNavigationBarItem(
//           //   icon: Icon(Icons.settings),
//           //   label: 'Setting',
//           //   backgroundColor: Color(0xffEFF2F4),
//           // ),
//         ],
//         // currentIndex: _selectedIndex,
//         currentIndex: dashboardState;
//         selectedItemColor: Colors.blue[800],
//         unselectedItemColor: Color(0xff91B1E7),
//         onTap: _onItemTapped,
//       );
      
//   }
// }