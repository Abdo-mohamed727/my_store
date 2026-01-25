import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_store/core/app/env_variables.dart';
import 'package:my_store/firebase_options.dart';
import 'package:my_store/my_store_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await EnvVariables.instance.init(envtype: EnumEnvTypes.dev);

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e, st) {
    debugPrint(st.toString());
  }

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}
