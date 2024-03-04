import 'dart:io';

import 'package:TribalTrove/config/routes/app.dart';
import 'package:TribalTrove/config/routes/app_route.dart';
import 'package:TribalTrove/core/common/provider/internet_connectivity.dart';
import 'package:TribalTrove/core/failure/failure.dart';
import 'package:TribalTrove/core/shared_pref/user_shared_prefs.dart';
import 'package:TribalTrove/feature/user/authentication_user/domain/entity/auth_entity.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/state/auth_state.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/view_model/auth_viewmodel.dart';
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
            const SizedBox(height: 320),
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
