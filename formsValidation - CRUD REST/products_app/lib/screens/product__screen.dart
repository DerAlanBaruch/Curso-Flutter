import 'package:flutter/material.dart';
import 'package:products_app/widgets/widgets.dart';

import '../ui/input_decorators.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  const ProductImage(),
                  Positioned(
                      top: 20,
                      left: 20,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_sharp,
                          size: 40,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      )),
                  Positioned(
                      top: 20,
                      right: 30,
                      child: IconButton(
                        icon: const Icon(
                          Icons.camera_alt,
                          size: 40,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ))
                ],
              ),
              const _ProductForm(),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {}, child: const Icon(Icons.save_sharp)),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BoxDecoration boxDecoration = BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 5),
              blurRadius: 5)
        ]);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: boxDecoration,
        width: double.infinity,
        child: Form(
            child: Column(
          children: [
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombre del producto', labelText: 'Nombre: '),
            ),
            const SizedBox(height: 30),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '\$150', labelText: 'Precio: '),
            ),
            const SizedBox(height: 30),
            SwitchListTile.adaptive(
              value: true,
              onChanged: (value) {},
              title: const Text('Disponibilidad'),
              activeColor: Colors.blueAccent,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        )),
      ),
    );
  }
}
