import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/core/app/images.dart';
import 'package:my_store/core/upload_image/cubit/cubit/upload_image_cubit.dart';

class UserAvatarImage extends StatelessWidget {
  const UserAvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UploadImageCubit>();
    return BlocBuilder<UploadImageCubit, UploadImageState>(
      builder: (context, state) {
        final isimageUrl = context.read<UploadImageCubit>().imageUrl.isNotEmpty;

        return state.maybeWhen(
          loading: () {
            return const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(AppImages.userAvatar),
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          },
          orElse: () {
            return CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 48,

                    backgroundColor: Colors.transparent,
                    backgroundImage: isimageUrl
                        ? NetworkImage(
                            context.read<UploadImageCubit>().imageUrl,
                          )
                        : const AssetImage(AppImages.userAvatar),
                  ),
                  IconButton(
                    onPressed: () async {
                      await cubit.uploadImage();
                    },
                    icon: const Icon(
                      Icons.add_a_photo,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
