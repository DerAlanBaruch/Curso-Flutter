import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final Uint8List? imageFile;
  final Uint8List? imageFileB;

  const HomeScreen({Key? key, this.imageFile, this.imageFileB}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imageFile != null) {}
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: imageFile == null
                  ? const Text('Front')
                  : Image.memory(imageFile!),
            ),
            Container(
              child: imageFileB == null
                  ? const Text('Back')
                  : Image.memory(imageFileB!),
            ),
          ],
        ),
      ),
    );
  }
}
