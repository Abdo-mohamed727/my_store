import 'package:get_it/get_it.dart';
import 'package:my_store/core/app/cubit/app_cubit_cubit.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  await _initcore();
}

Future<void> _initcore() async {
  sl.registerFactory(AppCubitCubit.new);
}
