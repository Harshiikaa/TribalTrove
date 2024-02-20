import 'package:TribalTrove/config/routes/app.dart';
import 'package:TribalTrove/core/networking/hive_service.dart';
import 'package:TribalTrove/core/shared_pref/user_shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  
   await HiveService().init();

     WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(child: App(
              token: prefs.getString('token'),

    )));
}