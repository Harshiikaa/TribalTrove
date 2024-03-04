import 'package:TribalTrove/config/constants/global_variables.dart';
import 'package:TribalTrove/feature/user/authentication_user/presentation/view_model/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPasswordPageView extends ConsumerStatefulWidget {
  const ForgotPasswordPageView({super.key});

  @override
  ConsumerState<ForgotPasswordPageView> createState() => _ForgotPasswordPageViewState();
}

class _ForgotPasswordPageViewState extends ConsumerState<ForgotPasswordPageView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Stack(
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
              bottom: 260,
              left: 20,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Forgot your password?",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              // Add underline decoration
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "Enter your email address here, we'll send a link to reset your password",
                            style: TextStyle(
                              color: GlobalVariables.tertiaryColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        prefixIcon: Icon(
                          Icons.mail_outlined,
                          color: GlobalVariables.greyColor,
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async{
                       if (_formKey.currentState!.validate()) {
                    // Validation successful, proceed with navigation
                    await ref.read(authViewModelProvider.notifier).forgetPassword(
                          context,
                          _emailController.text,
                        
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
                            'Send',
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
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
