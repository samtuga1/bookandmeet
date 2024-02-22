import 'package:bookandmeet/src/app.dart';
import 'package:bookandmeet/src/services/services.dart';
import 'package:bookandmeet/firebase_options_stage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();

  runApp(App());
}
