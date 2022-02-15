import 'package:flutter/material.dart';

import 'package:widget_app/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card Widget')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: const [
          CustomCard1(),
          SizedBox(height: 10),
          CustomCard2(imgUrl: 'assets/gato.jpg', title: 'Un gatito :3'),
          SizedBox(height: 10),
          CustomCard2(imgUrl: 'assets/loading.gif', title: 'Cargando...'),
          SizedBox(height: 10),
          CustomCard2(imgUrl: 'assets/gato.jpg',),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
