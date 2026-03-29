import 'package:image_picker/image_picker.dart';
import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/core/upload_image/data_source/upload_image_data_source.dart';
import 'package:my_store/core/upload_image/models/upload_image_response.dart';

class UploadImageRepo {
  UploadImageRepo(this._dataSource);

  final UploadImageDataSource _dataSource;

  Future<ApiResult<UploadImageResponse>> uploadImage(XFile image) async {
    try {
      final response = await _dataSource.uploadImage(image);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure('Error,please try again');
    }
  }
}
