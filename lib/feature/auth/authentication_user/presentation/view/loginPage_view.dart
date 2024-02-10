import 'package:TribalTrove/config/constants/global_variables.dart';
import 'package:TribalTrove/config/routes/app_route.dart';
import 'package:TribalTrove/core/common/snackbar/snackbar.dart';
import 'package:TribalTrove/feature/auth/authentication_user/domain/entity/auth_entity.dart';
import 'package:TribalTrove/feature/auth/authentication_user/presentation/view_model/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/constants/global_variables.dart';

class LoginPageView extends ConsumerStatefulWidget {
  const LoginPageView({super.key});

  @override
  ConsumerState<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends ConsumerState<LoginPageView> {
  final _key = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (authState.showMessage! && authState.error != null) {
        showSnackBar(message: 'Invalid Credentials', context: context);
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
            bottom: 130,
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
                                  decoration: TextDecoration
                                      .underline, // Add underline decoration
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
                                  // decoration: TextDecoration.underline,
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
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: TextFormField(
                          key: const ValueKey('email'),
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Enter your email',
                            prefixIcon: Icon(
                              Icons.mail_outlined,
                              color: GlobalVariables.greyColor,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter email';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: TextFormField(
                          key: const ValueKey('password'),
                          controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            prefixIcon: Icon(
                              Icons.lock_outline,
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
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/forgotPassPage');
                        },
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "Forgot Password?",
                                style: TextStyle(
                                  color: GlobalVariables.blueTextColor,
                                  fontSize: 18,
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
                ElevatedButton(
                  onPressed: () async {
                    if (_key.currentState!.validate()) {
                      await ref.read(authViewModelProvider.notifier).loginUser(
                            context,
                            _emailController.text,
                            _passwordController.text,
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
                          'Sign in',
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
                            text: "Don't have an account yet?",
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
                        Navigator.pushNamed(context, '/registerPage');
                      },
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: "Sign up",
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
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "Sign in with",
                        style: TextStyle(
                          color: GlobalVariables.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Ink(
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: CircleBorder(),
                          ),
                          child: Container(
                            width: 60, // Adjust the size as needed
                            height: 60, // Adjust the size as needed
                            // alignment: Alignment.bottomRight,
                            child: Image.asset(
                              'assets/images/facebook_logo.png', // Replace with your Google logo image
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Ink(
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: CircleBorder(),
                          ),
                          child: Container(
                            width: 60, // Adjust the size as needed
                            height: 60, // Adjust the size as needed
                            // alignment: Alignment.bottomRight,
                            child: Image.asset(
                              'assets/images/google_logo.png', // Replace with your Google logo image
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     // Handle Google sign-in here
                      //   },
                      //   child: Ink(
                      //     decoration: const ShapeDecoration(
                      //       color: Colors.white,
                      //       shape: CircleBorder(),
                      //     ),
                      //     child: Container(
                      //       width: 60, // Adjust the size as needed
                      //       height: 60, // Adjust the size as needed
                      //       alignment: Alignment.center,
                      //       child: Image.asset(
                      //         'assets/apple_logo.png', // Replace with your Google logo image
                      //         width: 40,
                      //         height: 40,
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
