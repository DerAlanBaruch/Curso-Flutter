import 'package:flutter/material.dart';

import 'package:widget_app/router/app_routes.dart';
import 'package:widget_app/themes/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: const Text('Componentes de Flutter')),
        body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
                  title: Text(AppRoutes.menuOptions[index].name),
                  leading: Icon(AppRoutes.menuOptions[index].icon, color: AppTheme.primary),
                  onTap: () {
                    // final route = MaterialPageRoute(
                    //     builder: (context) => const ListView2Screen());
                    // Navigator.push(context, route);
                    Navigator.pushNamed(
                        context, AppRoutes.menuOptions[index].route);
                  },
                ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: AppRoutes.menuOptions.length));
  }
}
