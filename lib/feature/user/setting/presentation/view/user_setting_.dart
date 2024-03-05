import 'dart:async';
import 'dart:io';

import 'package:TribalTrove/config/constants/global_variables.dart';
import 'package:TribalTrove/config/routes/app.dart';
import 'package:TribalTrove/config/routes/app_route.dart';
import 'package:TribalTrove/core/common/provider/internet_connectivity.dart';
import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/core/shared_pref/user_shared_prefs.dart';
import 'package:TribalTrove/feature/user/authentication_user/domain/entity/auth_entity.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/state/auth_state.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/view_model/auth_viewmodel.dart';
import 'package:all_sensors2/all_sensors2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class UserSettingView extends ConsumerStatefulWidget {
  const UserSettingView({super.key});

  @override
  ConsumerState<UserSettingView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends ConsumerState<UserSettingView> {
  late bool isDark = false;

late StreamSubscription<ProximityEvent> _proximityEvent;
  @override
  void initState() {
    super.initState();
    _proximityEvent = proximityEvents!.listen((ProximityEvent event) async {
      if (event.proximity < 2) {
        showLogoutConfirmationDialog(context);
      }
    });
  }
    Future<void> showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Do you want to logout?', ),
          actions: [
            TextButton(
              onPressed: () {
                
                Navigator.pop(context, false); // No
              },
              child: Text('No',style: TextStyle(color: Colors.grey),),
            ),
            TextButton(
              onPressed: () async {
                // Remove the token when user clicks Yes
                final userSharedPrefs = UserSharedPrefs();
                final result = await userSharedPrefs.deleteUserToken();

                result.fold(
                  (failure) {
                    // Handle failure
                    print("Failed to remove token: ${failure.error}");
                  },
                  (success) {
                    // Token removed successfully
                    print("Token removed successfully");
                    // Navigate to the login page
                    Navigator.pushReplacementNamed(context, '/loginPage');
                  },
                );
              },
              child: Text('Yes',style: TextStyle(color: Colors.grey),),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.popAndPushNamed(
                    context, AppRoute.updatePasswordRoute);
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.black,
              ),
              label: const Text(
                'Update Password',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(
                    243, 247, 244, 1), // Adjust color as needed
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.popAndPushNamed(context, AppRoute.updateProfileRoute);
              },
              icon: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: const Text(
                'Update Profile',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(
                    243, 247, 244, 1), // Adjust color as needed
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                showLogoutConfirmationDialog(context);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
              label: const Text(
                'Logout',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(
                    243, 247, 244, 1), // Adjust color as needed
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Icon(Icons.phone),
                SizedBox(width: 8),
                Center(
                  child: Center(
                    child: Text(
                      '9800000000',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '|',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(width: 8),
                Center(
                  child: Text(
                    'Hello',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
