import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/core/api/api_result.dart';
import 'package:my_store/core/upload_image/repo/upload_image_repo.dart';
import 'package:my_store/core/utils/image_pick.dart';

part 'upload_image_state.dart';
part 'upload_image_cubit.freezed.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit(this._imageRepo) : super(UploadImageState.initial());

  final UploadImageRepo _imageRepo;

  String imageUrl = '';

  Future<void> uploadImage() async {
    final pickedImage = await ImagePick().pickImages();
    if (pickedImage == null) return;

    emit(const UploadImageState.loading());
    final result = await _imageRepo.uploadImage(pickedImage);

    result.when(
      success: (image) {
        imageUrl = image.location ?? '';
        emit(const UploadImageState.success());
      },
      failure: (erroe) {
        emit(UploadImageState.error(errormessage: erroe));
      },
    );
  }

  void removeimage() {
    imageUrl = '';
    emit(UploadImageState.removeimage(imgUrl: imageUrl));
  }
}
