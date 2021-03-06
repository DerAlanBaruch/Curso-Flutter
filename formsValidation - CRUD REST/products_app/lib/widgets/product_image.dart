import 'dart:io';

import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String? url;
  const ProductImage({Key? key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(45), topRight: Radius.circular(45)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5))
        ]);
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Container(
        decoration: boxDecoration,
        width: double.infinity,
        height: 450,
        child: Opacity(
          opacity: 0.8,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(45), topRight: Radius.circular(45)),
            child: getImage(url),
          ),
        ),
      ),
    );
  }

  Widget? getImage(String? url) {
    if (url == null) {
      return const Image(
          image: AssetImage('assets/no-image.png'), fit: BoxFit.cover);
    }
    if (url.startsWith('http')) {
      return FadeInImage(
        image: NetworkImage(url),
        placeholder: const AssetImage('assets/jar-loading.gif'),
        fit: BoxFit.cover,
      );
    }
    return Image.file(File(url), fit: BoxFit.cover);
  }
}
