import 'package:dio/dio.dart';
import 'package:my_store/core/upload_image/models/upload_image_response.dart';
import 'package:my_store/features/admin/dashboard/data/models/categorey_number_response.dart';
import 'package:my_store/features/admin/add_categories/data/models/add_categories_response.dart';
import 'package:my_store/features/admin/add_categories/data/models/create_category_response.dart';
import 'package:my_store/features/admin/add_categories/data/models/update_category_response.dart';
import 'package:my_store/features/admin/add_products/data/models/get_all_products_response.dart';
import 'package:my_store/features/admin/dashboard/data/models/product_number_response.dart';
import 'package:my_store/features/admin/dashboard/data/models/user_number_response.dart';
import 'package:my_store/features/auth/data/models/login_response_body.dart';
import 'package:my_store/features/auth/data/models/sign_up_response.dart';
import 'package:my_store/features/auth/data/models/user_role_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

const String baseUrl = 'https://api.escuelajs.co';
const String graphQl = '/graphql';

@RestApi(baseUrl: baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(graphQl)
  Future<LoginResponse> login(@Body() Map<String, dynamic> loginbody);

  @GET('/api/v1/auth/profile')
  Future<UserRoleResponse> userRole();

  @POST('/api/v1/files/upload')
  Future<UploadImageResponse> uploadImage(@Body() FormData image);

  @POST(graphQl)
  Future<SignUpResponse> signUp(@Body() Map<String, dynamic> signUpBody);

  @POST(graphQl)
  Future<ProductNumberResponse> getProductsNumber(
    @Body() Map<String, dynamic> query,
  );

  @POST(graphQl)
  Future<UsersNumberResponse> getUsersNumber(
    @Body() Map<String, dynamic> query,
  );

  @POST(graphQl)
  Future<CategoryNumberResponse> getCategoryNumber(
    @Body() Map<String, dynamic> query,
  );

  @POST(graphQl)
  Future<GetAllCategoriesResponse> getAllCategories(
    @Body() Map<String, dynamic> query,
  );

  @POST(graphQl)
  Future<CreateCategoryResponse> createCategory(
    @Body() Map<String, dynamic> mutation,
  );

  @POST(graphQl)
  Future<UpdateCategoryResponse> updateCategory(
    @Body() Map<String, dynamic> mutation,
  );

  @POST(graphQl)
  Future<void> deleteCategory(
    @Body() Map<String, dynamic> mutation,
  );

  @POST(graphQl)
  Future<GetAllProductResponse> getAllProducts(
    @Body() Map<String, dynamic> query,
  );
}
