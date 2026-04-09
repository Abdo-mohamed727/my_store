import 'package:get_it/get_it.dart';
import 'package:my_store/core/api/api_service.dart';
import 'package:my_store/core/api/dio_factory.dart';
import 'package:my_store/core/app/cubit/app_cubit_cubit.dart';
import 'package:my_store/core/upload_image/cubit/cubit/upload_image_cubit.dart';
import 'package:my_store/core/upload_image/data_source/upload_image_data_source.dart';
import 'package:my_store/core/upload_image/repo/upload_image_repo.dart';
import 'package:my_store/features/admin/add_categories/data/data_source/add_categories_data_source.dart';
import 'package:my_store/features/admin/add_categories/data/repo/add_categories_repo.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/create_category/create_category_bloc.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/get_all_categories/get_all_categories_bloc.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/update_category/update_category_bloc.dart';
import 'package:my_store/features/admin/add_categories/presintation/bloc/delete_category/delete_category_bloc.dart';
import 'package:my_store/features/admin/dashboard/data/data_source/dashboard_admin_data_source.dart';
import 'package:my_store/features/admin/dashboard/data/repo/dashboard_admin_repo.dart';
import 'package:my_store/features/admin/dashboard/presintation/bloc/categories_number/categories_number_bloc.dart';
import 'package:my_store/features/admin/dashboard/presintation/bloc/products_number/products_number_bloc.dart';
import 'package:my_store/features/admin/dashboard/presintation/bloc/users_number/users_number_bloc.dart';
import 'package:my_store/features/auth/data/data_source/auth_data_source.dart';
import 'package:my_store/features/auth/data/repo/auth_repo.dart';
import 'package:my_store/features/auth/presintation/cubit/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  await _initcore();
  await _initAuth();
  await _initAddCategories();
  await _initDashboardAdmin();
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

Future<void> _initAddCategories() async {
  sl
    ..registerFactory(() => GetAllCategoriesBloc(sl()))
    ..registerFactory(() => CreateCategoryBloc(sl()))
    ..registerFactory(() => UpdateCategoryBloc(sl()))
    ..registerFactory(() => DeleteCategoryBloc(sl()))
    ..registerLazySingleton(() => AddCategoriesDataSource(sl()))
    ..registerLazySingleton(() => AddCategoriesRepo(sl()));
}

Future<void> _initDashboardAdmin() async {
  sl
    ..registerFactory(() => ProductsNumberBloc(sl()))
    ..registerFactory(() => UsersNumberBloc(sl()))
    ..registerFactory(() => CategoriesNumberBloc(sl()))
    ..registerLazySingleton(() => DashboardAdminDataSource(sl()))
    ..registerLazySingleton(() => DashboardAdminRepo(sl()));
}
