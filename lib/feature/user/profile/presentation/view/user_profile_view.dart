import 'package:TribalTrove/config/routes/app.dart';
import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/core/shared_pref/user_shared_prefs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfileView extends ConsumerStatefulWidget {
  const UserProfileView({super.key});

  @override
  ConsumerState<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends ConsumerState<UserProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Your Profile')),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(children: [
        ElevatedButton(
            onPressed: () async {
              // Directly clear the token
              var userSharedPrefs = UserSharedPrefs();
              var result = await userSharedPrefs.deleteUserToken();

              // Handle the result as needed
              result.fold(
                (failure) {
                  // Handle failure
                  print("Error: ${failure.error}");
                },
                (success) {
                  // Handle success
                  print("Token deleted successfully");
                },
              );

              // Optionally, navigate to the login screen or perform other actions
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: Text("Logout"))
      ]),
    );
  }
}
