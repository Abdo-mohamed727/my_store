import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnumEnvTypes { dev, prod }

class EnvVariables {
  EnvVariables._();

  static final EnvVariables instance = EnvVariables._();

  String _envType = '';

  Future<void> init({required EnumEnvTypes envtype}) async {
    switch (envtype) {
      case EnumEnvTypes.dev:
        await dotenv.load(fileName: '.env.dev');
      case EnumEnvTypes.prod:
        await dotenv.load(fileName: '.env.prod');
    }
    _envType = dotenv.get('ENV_TYPE');
  }

  String get envType => _envType;
}
