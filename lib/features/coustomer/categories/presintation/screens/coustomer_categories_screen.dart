import 'package:flutter/material.dart';

class CoustomerCategoriesScreen extends StatelessWidget {
  const CoustomerCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: const Center(
        child: Text('Categories Screen'),
      ),
    );
  }
}
