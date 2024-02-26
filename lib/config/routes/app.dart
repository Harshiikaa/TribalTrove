import 'package:TribalTrove/config/routes/app_route.dart';
import 'package:TribalTrove/config/themes/theme_dart.dart';
import 'package:TribalTrove/core/common/provider/is_dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  final token;
  const App({required this.token, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(isDarkThemeProvider);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tribal Trove',
        theme: AppTheme.getApplicationTheme(isDarkTheme),
        // initialRoute: AppRoute.dashboardAdminScreenRoute,
        initialRoute: AppRoute.loginPageRoute,
        routes: AppRoute.getApplication());
  }
}
