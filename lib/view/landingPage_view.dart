import 'package:flutter/material.dart';

class LandingPageView extends StatefulWidget {
  const LandingPageView({super.key});

  @override
  State<LandingPageView> createState() => _LandingPageViewState();
}

class _LandingPageViewState extends State<LandingPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            top: 240,
            bottom: 510,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.topCenter,
              color: Colors.white,
              // decoration: BoxDecoration(
              //   // image: DecorationImage(
              //     // image: AssetImage("assets/images/landingPage.png"),
              //     // fit: BoxFit.cover,
              //   ),
            ),
            // height: double.infinity,
            // width: double.infinity ,
          ),
          // ),

          Positioned(
            top: 700,
            bottom: 100,
            left: 100,
            right: 100,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/loginPage');
              },
              child: Text(
                'Start',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}
