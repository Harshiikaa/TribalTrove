import 'dart:io';

import 'package:TribalTrove/core/common/provider/internet_connectivity.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/view/loginPage_view.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/view_model/auth_viewmodel.dart';
import 'package:TribalTrove/feature/user/dashboard/presentation/view/dashboard_view.dart';
import 'package:TribalTrove/feature/user/setting/presentation/view/user_setting_.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class UpdateProfile extends ConsumerStatefulWidget {
  const UpdateProfile({super.key});

  @override
  ConsumerState<UpdateProfile> createState() => _updateProfileViewState();
}

class _updateProfileViewState extends ConsumerState<UpdateProfile> {
  final _gap = const SizedBox(height: 20);

  final _key = GlobalKey<FormState>();
  final _updateFnameController = TextEditingController();
  final _updateLnameController = TextEditingController();
  final _updateEmailController = TextEditingController();
  final _updatePhoneNumberController = TextEditingController();

  bool isObscure = true;
  File? _img;

  // Check for the camera permission
  checkCameraPermission() async {
    if (await Permission.camera.request().isRestricted ||
        await Permission.camera.request().isDenied) {
      await Permission.camera.request();
    }
  }

  // A method to load user data into the form fields.

  Future _browseImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          _img = File(image.path);
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width > 600;
    final isConnected = ref.watch(connectivityStatusProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Profile"),
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DashboardView()));
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.grey[300],
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(10),
                          ),
                        ),
                        builder: (context) => Padding(
                          padding: const EdgeInsets.all(22),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  checkCameraPermission();
                                  _browseImage(ImageSource.camera);
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.camera),
                                label: const Text('Camera'),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  _browseImage(ImageSource.gallery);
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.image),
                                label: const Text('Gallery'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: _img != null
                            ? FileImage(_img!)
                            : const AssetImage('assets/images/logo.png')
                                as ImageProvider,
                      ),
                    ),
                  ),
                  _gap,
                  TextFormField(
                    controller: _updateFnameController,
                    decoration: InputDecoration(
                        labelText: 'First Name',
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        )),
                    keyboardType: TextInputType.name,
                  ),
                  _gap,
                  TextFormField(
                    controller: _updateLnameController,
                    decoration: InputDecoration(
                        labelText: 'Last Name',
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        )),
                    keyboardType: TextInputType.name,
                  ),
                  _gap,
                  TextFormField(
                    controller: _updateEmailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  _gap,
                  TextFormField(
                    controller: _updatePhoneNumberController,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      prefixIcon: const Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        // Validation successful, proceed with navigation
                        await ref
                            .read(authViewModelProvider.notifier)
                            .updateUserProfile(
                              _updateFnameController.text,
                              _updateLnameController.text,
                              _updateEmailController.text,
                              _updatePhoneNumberController.text,
                              _img!,
                              context,
                            );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 150,
                          vertical: 15), // Increased button padding
                    ),
                    child: const Text(
                      'Update Profile',
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
