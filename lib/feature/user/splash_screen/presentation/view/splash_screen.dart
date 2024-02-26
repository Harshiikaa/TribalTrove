import 'package:TribalTrove/feature/user/splash_screen/presentation/view_model/splash_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreenView extends ConsumerStatefulWidget {
  const SplashScreenView({super.key});

  @override
  ConsumerState<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends ConsumerState<SplashScreenView> {
  @override
  void initState() {
    // Wait for 2 seconds and then navigate
    Future.delayed(const Duration(seconds: 2), () {
      ref.read(splashViewModelProvider.notifier).init(context);
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset('assets/images/logo.png'),
                ),
                // const Text(
                //   'TribalTrove',
                //   style: TextStyle(
                //     fontSize: 25,
                //   ),
                // ),
                const SizedBox(height: 10),
                const CircularProgressIndicator(),
                const SizedBox(height: 10),
                const Text('version : 1.0.0')
              ],
            ),
          ),
          // Positioned(
          //   bottom: 10,
          //   left: MediaQuery.of(context).size.width / 4,
          //   child: const Text(
          //     'Developed by: Harshika',
          //     style: TextStyle(fontSize: 15),
          //   ),
          // ),
        ],
      ),
    );
  }
}
