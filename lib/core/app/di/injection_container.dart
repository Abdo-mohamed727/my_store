import 'package:get_it/get_it.dart';
import 'package:my_store/core/api/api_service.dart';
import 'package:my_store/core/api/dio_factory.dart';
import 'package:my_store/core/app/cubit/app_cubit_cubit.dart';
import 'package:my_store/core/upload_image/cubit/cubit/upload_image_cubit.dart';
import 'package:my_store/core/upload_image/data_source/upload_image_data_source.dart';
import 'package:my_store/core/upload_image/repo/upload_image_repo.dart';
import 'package:my_store/features/auth/data/data_source/auth_data_source.dart';
import 'package:my_store/features/auth/data/repo/auth_repo.dart';
import 'package:my_store/features/auth/presintation/cubit/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  await _initcore();
  await _initAuth();
}

Future<void> _initcore() async {
  final dio = DioFactory.getDio();
  sl
    ..registerFactory(AppCubitCubit.new)
    ..registerLazySingleton(() => ApiService(dio))
    ..registerFactory(() => UploadImageCubit(sl()))
    ..registerLazySingleton(() => UploadImageDataSource(sl()))
    ..registerLazySingleton(() => UploadImageRepo(sl()));
}

Future<void> _initAuth() async {
  sl
    ..registerFactory(() => AuthBloc(sl()))
    ..registerLazySingleton(() => AuthDataSource(sl()))
    ..registerLazySingleton(() => AuthRepo(sl()));
}
