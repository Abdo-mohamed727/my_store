import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_store/my_store_app.dart';

void main()async {
WidgetsFlutterBinding.ensureInitialized();
Platform.isAndroid ?
await Firebase.initializeApp(
  options: FirebaseOptions(apiKey: "AIzaSyDjPUrSjEVldWvg1yHPcA_IE0Nbeck6xDg", appId: "1:770837074012:android:ccb724723e41fb60cfd699", messagingSenderId:  "770837074012", projectId:  "e-commerce-ea47b")
):await Firebase.initializeApp();

  runApp(const MyApp());
}



 