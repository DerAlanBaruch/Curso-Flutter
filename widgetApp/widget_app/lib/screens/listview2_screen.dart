import 'package:flutter/material.dart';
import 'package:widget_app/themes/app_theme.dart';

class ListView2Screen extends StatelessWidget {
  final options = const ['Hola', 'Que tranza', 'Que sucede', 'Nada xd'];

  const ListView2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List View 2')),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                title: Text(options[index]),
                leading:
                    const Icon(Icons.ac_unit_rounded, color: AppTheme.primary),
                trailing: const Icon(Icons.arrow_forward_ios_rounded,
                    color: AppTheme.primary),
                onTap: () {
                  final game = options[index];
                  print(game);
                },
              ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: options.length),
    );
  }
}
