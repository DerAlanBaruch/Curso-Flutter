import 'package:flutter/material.dart';
import 'package:preferences_app/widgets/side_menu.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../share_preferences/preferences.dart';

class SettingsScreen extends StatefulWidget {
  static const String routerName = 'settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // bool isDarkMode = false;
  // int genre = 1;
  // String name = 'Alan';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      drawer: const SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ajustes',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300)),
            const Divider(),
            SwitchListTile.adaptive(
                value: Preferences.isDarkMode,
                onChanged: (value) {
                  Preferences.isDarkMode = value;
                  final themeProvider =
                      Provider.of<ThemeProvider>(context, listen: false);
                  value
                      ? themeProvider.setDarkMode()
                      : themeProvider.setLightMode();
                  setState(() {});
                },
                title: const Text('DarkMode')),
            const Divider(),
            RadioListTile<int>(
                value: 1,
                groupValue: Preferences.genre,
                onChanged: (value) {
                  Preferences.genre = value ?? 1;
                  setState(() {});
                },
                title: const Text('Masculino')),
            RadioListTile<int>(
                value: 2,
                groupValue: Preferences.genre,
                onChanged: (value) {
                  Preferences.genre = value ?? 2;
                  setState(() {});
                },
                title: const Text('Femenino')),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: Preferences.name,
                  onChanged: (value) {
                    Preferences.name = value;
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                      labelText: 'Nombre', helperText: 'Nombre del Usuario'),
                ))
          ],
        )),
      ),
    );
  }
}
