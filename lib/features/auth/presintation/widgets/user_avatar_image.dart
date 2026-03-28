import 'package:flutter/material.dart';
import 'package:my_store/core/utils/image_pick.dart';

class UserAvatarImage extends StatelessWidget {
  const UserAvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await ImagePick().pickImages();
      },
      child: const CircleAvatar(
        radius: 50,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 48,

          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJkuzo42UHRAe_U-LekbkkVrW7QozJFUrdww&s',
          ),
        ),
      ),
    );
  }
}
