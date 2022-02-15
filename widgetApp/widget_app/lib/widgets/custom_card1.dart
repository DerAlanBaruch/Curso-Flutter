import 'package:flutter/material.dart';
import 'package:widget_app/themes/app_theme.dart';

class CustomCard1 extends StatelessWidget {
  const CustomCard1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: [
      const ListTile(
          leading:
              Icon(Icons.access_time_filled_outlined, color: AppTheme.primary),
          title: Text('Hola soy una tarjeta'),
          subtitle: Text(
              'lorem ipsum dolor sit am, lorem ipsum dolor sit am, lorem ipsum dolor sit am, lorem ipsum dolor sit am')),
      Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          TextButton(
            onPressed: () {},
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Ok'),
          ),
        ]),
      )
    ]));
  }
}
