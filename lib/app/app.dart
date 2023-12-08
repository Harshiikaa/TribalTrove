import 'package:TribalTrove/app/app_route.dart';
import 'package:TribalTrove/theme/theme_dart.dart';
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
        initialRoute: AppRoute.loginPageRoute,
        routes: AppRoute.getApplication());
  }
}
