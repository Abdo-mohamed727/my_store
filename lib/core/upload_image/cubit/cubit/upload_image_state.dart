part of 'upload_image_cubit.dart';

@freezed
class UploadImageState with _$UploadImageState {
  const factory UploadImageState.initial() = _Initial;
  const factory UploadImageState.loading() = LoadingState;
  const factory UploadImageState.success() = SUccessState;
  const factory UploadImageState.removeimage({required String imgUrl}) =
      RemoveImageState;
  const factory UploadImageState.error({required String errormessage}) =
      ErrorState;
}
