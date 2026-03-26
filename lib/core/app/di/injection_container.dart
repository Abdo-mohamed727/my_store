import 'package:get_it/get_it.dart';
import 'package:my_store/core/api/api_service.dart';
import 'package:my_store/core/api/dio_factory.dart';
import 'package:my_store/core/app/cubit/app_cubit_cubit.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  await _initcore();
}

Future<void> _initcore() async {
  final dio = DioFactory.getDio();
  sl
    ..registerFactory(AppCubitCubit.new)
    ..registerLazySingleton(() => ApiService(dio));
}
