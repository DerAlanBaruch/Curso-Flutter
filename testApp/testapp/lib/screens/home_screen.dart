import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const fontSize = TextStyle(fontSize: 30);
    int counter = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Numero de Clicks',
              style: fontSize,
            ),
            Text('$counter', style: fontSize)
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one_rounded),
        onPressed: () {
          counter++;
        },
      ),
    );
  }
}
