import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_store/core/app/bloc_observation.dart';
import 'package:my_store/core/app/di/injection_container.dart';
import 'package:my_store/core/app/env_variables.dart';
import 'package:my_store/core/services/shared_pref/share_pref.dart';
import 'package:my_store/firebase_options.dart';
import 'package:my_store/my_store_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  await SharedPref().instantiatePreferences();
  await setupInjector();

  Bloc.observer = AppBlocObserver();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}
