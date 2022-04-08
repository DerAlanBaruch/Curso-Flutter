import 'package:flutter/material.dart';
import 'package:preferences_app/share_preferences/preferences.dart';

import '../widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String routerName = 'home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: const SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('IsDarkMode: ${Preferences.isDarkMode}'),
          const Divider(),
          Text('Genero: ${Preferences.genre}'),
          const Divider(),
          Text('Nombre de Usuario: ${Preferences.name}'),
          const Divider(),
        ],
      ),
    );
  }
}
