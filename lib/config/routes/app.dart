import 'package:TribalTrove/config/routes/app_route.dart';
import 'package:TribalTrove/config/themes/theme_dart.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tribal Trove',
        theme: getApplicationTheme(),
        debugShowCheckedModeBanner: false,
        // initialRoute: AppRoute.dashboardAdminScreenRoute,
        initialRoute: AppRoute.rolePageRoute,
        routes: AppRoute.getApplication());
  }
}
