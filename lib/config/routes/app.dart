import 'package:TribalTrove/config/routes/app_route.dart';
import 'package:TribalTrove/config/themes/theme_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  final token;
  const App({required this.token, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tribal Trove',
        theme: getApplicationTheme(),
        // initialRoute: AppRoute.dashboardAdminScreenRoute,
        initialRoute: AppRoute.loginPageRoute,
        routes: AppRoute.getApplication());
  }
}
