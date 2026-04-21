import 'package:flutter/material.dart';

class CoustomerFavouriteScreen extends StatelessWidget {
  const CoustomerFavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite'),
      ),
      body: const Center(
        child: Text('Favourite Screen'),
      ),
    );
  }
}
