// import 'dart:async';

// import 'package:TribalTrove/feature/authentication/presentation/view/loginPage_view.dart';
// import 'package:all_sensors2/all_sensors2.dart';
// import 'package:flutter/material.dart';

// class ProximityScreen extends StatefulWidget {
//   const ProximityScreen({super.key});

//   @override
//   State<ProximityScreen> createState() => _ProximityScreenState();
// }

// class _ProximityScreenState extends State<ProximityScreen> {

//   double _proximityValue = 0.0;
//   final List<StreamSubscription<dynamic>> _streamSubscription = 
//   <StreamSubscription<dynamic>>[];

//   @override
//   void initState(){
//     super.initState();
//     _streamSubscription.add(
//       proximityEvents!.listen((event) {
//         setState(() {
//           _proximityValue = event.proximity;
//         });
//       })
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Proximity'),
//       ),
//       body:  Center(
//         child: _proximityValue >= 4
//         ?   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const LoginPageView()),
//                   ),
//                    ),
//     );
//   }
// }
