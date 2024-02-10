import 'dart:io';

import 'package:TribalTrove/core/common/provider/internet_connectivity.dart';
import 'package:TribalTrove/core/common/snackbar/snackbar.dart';
import 'package:TribalTrove/feature/user/authentication_user/domain/entity/auth_entity.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/view_model/auth_viewmodel.dart';
import 'package:TribalTrove/view/commons/parentPage.dart';
import 'package:TribalTrove/config/constants/global_variables.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterPageView extends ConsumerStatefulWidget {
  const RegisterPageView({super.key});

  @override
  ConsumerState<RegisterPageView> createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends ConsumerState<RegisterPageView> {
  final _key = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isObscure = true;


    // Check for the camera permission
  // checkCameraPermission() async {
  //   if (await Permission.camera.request().isRestricted ||
  //       await Permission.camera.request().isDenied) {
  //     await Permission.camera.request();
  //   }
  // }

  //   File? _img;
  // Future _browseImage(ImageSource imageSource) async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: imageSource);
  //     if (image != null) {
  //       _img = File(image.path);
  //       ref.read(authViewModelProvider.notifier).uploadImage(_img!);
  //     } else {
  //       return;
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final isConnected = ref.watch(connectivityStatusProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isConnected == ConnectivityStatus.isDisconnected) {
        showSnackBar(
            message: 'No Internet Connection',
            context: context,
            color: Colors.red);
      } else if (isConnected == ConnectivityStatus.isConnected) {
        showSnackBar(message: 'You are online', context: context);
      }

      if (ref.watch(authViewModelProvider).showMessage!) {
        showSnackBar(
            message: 'User Registerd Successfully', context: context);
        ref.read(authViewModelProvider.notifier).resetMessage();
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/landingPage.png"),
                fit: BoxFit.cover,
              ),
            ),
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
            top: 200,
            bottom: 70,
            left: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/loginPage');
                        },
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "Sign In",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  // decoration: TextDecoration
                                  //     .underline, // Add underline decoration
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/registerPage');
                        },
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "Sign Up",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Form(
                  key: _key,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: TextFormField(
                        key: const ValueKey('firstName'),
                        controller: _firstNameController,
                        decoration: InputDecoration(
                          hintText: 'Enter your firstName',
                          prefixIcon: Icon(
                            Icons.person_outlined,
                            color: GlobalVariables.greyColor,
                          ),
                        ),
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter first name';
                          }
                          return null;
                        }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: TextFormField(
                        key: const ValueKey('lastName'),
                        controller: _lastNameController,
                        decoration: InputDecoration(
                          hintText: 'Enter your lastName',
                          prefixIcon: Icon(
                            Icons.person_outlined,
                            color: GlobalVariables.greyColor,
                          ),
                        ),
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter last name';
                          }
                          return null;
                        }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: TextFormField(
                        key: const ValueKey('email'),
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: GlobalVariables.greyColor,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          }
                          RegExp emailRegExp =
                              RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

                          if (!emailRegExp.hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }

                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: TextFormField(
                        key: const ValueKey('phoneNumber'),
                        controller: _phoneController,
                        decoration: InputDecoration(
                          hintText: 'Enter your phone number',
                          prefixIcon: Icon(
                            Icons.phone_android_outlined,
                            color: GlobalVariables.greyColor,
                          ),
                        ),
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone Number';
                          }
                          return null;
                        }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: TextFormField(
                        key: const ValueKey('password'),
                        obscureText: isObscure,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: 'create your password',
                          prefixIcon: Icon(
                            Icons.lock,
                            color: GlobalVariables.greyColor,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                          ),
                        ),
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        }),
                      ),
                    ),
                  ]),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_key.currentState!.validate()) {
                      final entity = AuthEntity(
                        firstName: _firstNameController.text.trim(),
                        lastName: _lastNameController.text.trim(),
                        email: _emailController.text.trim(),
                        phoneNumber: _phoneController.text.trim(),
                        password: _passwordController.text,
                      );
                      // Register user
                      ref
                          .read(authViewModelProvider.notifier)
                          .registerUser(entity)
                          .then(
                        (registrationSuccessful) {
                          // if (registrationSuccessful) {
                          //   // If registration is successful, navigate to the login page
                          //   // '/login' should match the route defined for the login page in MaterialApp
                          // }
                        },
                      );
                    }
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          GlobalVariables.blueButtonLinear1,
                          GlobalVariables.blueButtonLinear2,
                        ]),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                      child: Container(
                        width: 160,
                        height: 40,
                        alignment: Alignment.center,
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Go back to",
                            style: TextStyle(
                              color: GlobalVariables.tertiaryColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/loginPage');
                      },
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Sign in",
                              style: TextStyle(
                                color: GlobalVariables.blueTextColor,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/registerPageMerchant');
                  },
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "Become a Seller",
                          style: TextStyle(
                            color: GlobalVariables.blueTextColor,
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: RichText(
                //     text: TextSpan(
                //       children: <TextSpan>[
                //         TextSpan(
                //           text: "Sign in with",
                //           style: TextStyle(
                //             color: GlobalVariables.primaryColor,
                //             fontSize: 16,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(17.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       GestureDetector(
                //         onTap: () {},
                //         child: Ink(
                //           decoration: const ShapeDecoration(
                //             color: Colors.white,
                //             shape: CircleBorder(),
                //           ),
                //           child: Container(
                //             width: 60, // Adjust the size as needed
                //             height: 60, // Adjust the size as needed
                //             // alignment: Alignment.bottomRight,
                //             child: Image.asset(
                //               'assets/images/facebook_logo.png', // Replace with your Google logo image
                //               width: 40,
                //               height: 40,
                //             ),
                //           ),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Ink(
                //           decoration: const ShapeDecoration(
                //             color: Colors.white,
                //             shape: CircleBorder(),
                //           ),
                //           child: Container(
                //             width: 60, // Adjust the size as needed
                //             height: 60, // Adjust the size as needed
                //             // alignment: Alignment.bottomRight,
                //             child: Image.asset(
                //               'assets/images/google_logo.png', // Replace with your Google logo image
                //               width: 40,
                //               height: 40,
                //             ),
                //           ),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {
                //           // Handle Google sign-in here
                //         },
                //         child: Ink(
                //           decoration: const ShapeDecoration(
                //             color: Colors.white,
                //             shape: CircleBorder(),
                //           ),
                //           child: Container(
                //             width: 60, // Adjust the size as needed
                //             height: 60, // Adjust the size as needed
                //             alignment: Alignment.center,
                //             child: Image.asset(
                //               'assets/apple_logo.png', // Replace with your Google logo image
                //               width: 40,
                //               height: 40,
                //             ),
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
