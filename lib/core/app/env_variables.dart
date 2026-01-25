import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnumEnvTypes { dev, prod }

class EnvVariables {
  EnvVariables._();

  static final EnvVariables instance = EnvVariables._();

  String _envType = '';

  Future<void> init({required EnumEnvTypes envtype}) async {
    if (envtype == EnumEnvTypes.dev) {
      await dotenv.load(fileName: '.env.dev');
    } else {
      await dotenv.load(fileName: '.env.prod');
    }

    _envType = dotenv.env['ENV_TYPE'] ?? '';
  }

  String get envType => _envType;
}
