import 'package:flutter/material.dart';

class ListView1Screen extends StatelessWidget {
  final options = const ['Hola', 'Que tranza', 'Que sucede', 'Nada xd'];

  const ListView1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List View 1'),
      ),
      body: ListView(
        children: [
          ...options
              .map((e) => ListTile(
                    title: Text(e),
                    trailing: const Icon(Icons.ac_unit_outlined),
                  ))
              .toList()
        ],
      ),
    );
  }
}
