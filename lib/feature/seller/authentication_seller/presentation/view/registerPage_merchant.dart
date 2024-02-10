import 'package:TribalTrove/config/constants/global_variables.dart';
import 'package:TribalTrove/core/common/provider/internet_connectivity.dart';
import 'package:TribalTrove/core/common/snackbar/snackbar.dart';
import 'package:TribalTrove/feature/seller/authentication_seller/domain/entity/auth_entity_seller.dart';
import 'package:TribalTrove/feature/seller/authentication_seller/presentation/state/auth_state_seller.dart';
import 'package:TribalTrove/feature/seller/authentication_seller/presentation/view_model/auth_seller_viewmodel.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterPageMerchant extends ConsumerStatefulWidget {
  const RegisterPageMerchant({super.key});

  @override
  ConsumerState<RegisterPageMerchant> createState() => _RegisterPageMerchantState();
}

class _RegisterPageMerchantState extends ConsumerState<RegisterPageMerchant> {
  // final List<String> roleItems = [
  //   'User',
  //   'Merchant',
  // ];
  final _key = GlobalKey<FormState>();
  final _businessNameController = TextEditingController();
  final _businessPhoneController = TextEditingController();
  final _businessAddressController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    // final isConnected = ref.watch(connectivityStatusProvider);

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (isConnected == ConnectivityStatus.isDisconnected) {
    //     showSnackBar(
    //         message: 'No Internet Connection',
    //         context: context,
    //         color: Colors.red);
    //   } else if (isConnected == ConnectivityStatus.isConnected) {
    //     showSnackBar(message: 'You are online', context: context);
    //   }

    //   if (ref.watch(authViewModelSellerProvider).showMessage!) {
    //     showSnackBar(
    //         message: 'Student Registerd Successfully', context: context);
    //     ref.read(authViewModelSellerProvider.notifier).resetMessage();
    //   }
    // });
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
                      hintText: 'Business Name',
                      hintStyle: TextStyle(color: GlobalVariables.greyColor),
                      prefixIcon: Icon(
                        Icons.business,
                        color: GlobalVariables.greyColor,
                      ),
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your bunsiness name';
                      }
                      return null;
                    }),
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
                      hintText: 'Business Phone Number',
                      hintStyle: TextStyle(color: GlobalVariables.greyColor),
                      prefixIcon: Icon(
                        Icons.phone_outlined,
                        color: GlobalVariables.greyColor,
                      ),
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter business contact number';
                      }
                      return null;
                    }),
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
                      hintText: 'Business Address',
                      hintStyle: TextStyle(color: GlobalVariables.greyColor),
                      prefixIcon: Icon(
                        Icons.location_city_outlined,
                        color: GlobalVariables.greyColor,
                      ),
                    ),
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter business address';
                      }
                      return null;
                    }),
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
                      hintText: 'Email',
                      hintStyle: TextStyle(color: GlobalVariables.greyColor),
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
                    key: const ValueKey('password'),
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: GlobalVariables.greyColor,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isObscure ? Icons.visibility : Icons.visibility_off,
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
                ElevatedButton(
                  onPressed: () {
                     if (_key.currentState!.validate()) {
                      final entity = AuthEntitySeller(
                        businessName: _businessNameController.text.trim(),
                        businessAddress: _businessAddressController.text.trim(),
                        email: _emailController.text.trim(),
                        businessPhone: _businessPhoneController.text.trim(),
                        password: _passwordController.text,
                      );
                      // Register user
                      ref
                          .read(authViewModelSellerProvider.notifier)
                          .registerSeller(entity)
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
                        Navigator.pushNamed(context, '/registerPage');
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
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
