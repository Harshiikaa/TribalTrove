import 'package:TribalTrove/feature/user/authentication_user/presentation/view_model/auth_viewmodel.dart';
import 'package:TribalTrove/feature/user/dashboard/presentation/view/dashboard_view.dart';
import 'package:TribalTrove/feature/user/setting/presentation/view/user_setting_.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdatePasswordView extends ConsumerStatefulWidget {
  const UpdatePasswordView({super.key});

  @override
  ConsumerState<UpdatePasswordView> createState() => _UpdatePasswordViewState();
}

class _UpdatePasswordViewState extends ConsumerState<UpdatePasswordView> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password"),
           leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardView()));
          },
        ),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              TextFormField(
                key: const ValueKey('Current password'),
                controller: _currentPasswordController,
                decoration: InputDecoration(
                  labelText: 'Current Password',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  contentPadding: const EdgeInsets.all(15.0),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter current Password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                key: const ValueKey(' password'),
                controller: _newPasswordController,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  contentPadding: const EdgeInsets.all(15.0),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter current Password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                key: const ValueKey('Confirm password'),
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: ' Confirm Password',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  contentPadding: const EdgeInsets.all(15.0),
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Validation successful, proceed with navigation
                    await ref
                        .read(authViewModelProvider.notifier)
                        .updateUserPassword(
                          _currentPasswordController.text,
                          _newPasswordController.text,
                          _confirmPasswordController.text,
                          context,
                        );
                  }
                },
                child: const Text('Update Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
