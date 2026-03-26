import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

const String baseUrl = 'https://api.escuelajs.co';
const String graphQl = '/graphql';

@RestApi(baseUrl: baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // TODO: Add your API endpoints here
}
