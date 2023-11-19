import 'package:TribalTrove/app/app_route.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tribal Trove',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoute.landingPageRoute,
        routes: AppRoute.getApplication());
  }
}
