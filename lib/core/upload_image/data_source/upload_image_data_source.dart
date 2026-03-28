import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_store/core/api/api_service.dart';
import 'package:my_store/core/upload_image/models/upload_image_response.dart';

class UploadImageDataSource {
  UploadImageDataSource(this._apiService);
  final ApiService _apiService;

  Future<UploadImageResponse> uploadImage(XFile image) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(image.path),
    });
    final response = await _apiService.uploadImage(formData);
    return response;
  }
}
