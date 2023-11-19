import 'package:TribalTrove/view/constants/global_variables.dart';
import 'package:flutter/material.dart';

import 'constants/global_variables.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.all(10), // Adjust internal padding

                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: GlobalVariables.outlineColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: GlobalVariables.outlineColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: GlobalVariables.greyBackgroundColor,
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(color: GlobalVariables.greyColor),
                      prefixIcon: Icon(
                        Icons.mail_outlined,
                        color: GlobalVariables.greyColor,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: TextFormField(
                      decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.all(10), // Adjust internal padding
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: GlobalVariables.outlineColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: GlobalVariables.outlineColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: GlobalVariables.greyBackgroundColor,
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(color: GlobalVariables.greyColor),
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: GlobalVariables.greyColor,
                    ),
                  )),
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
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
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
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "Continue as a guest",
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
