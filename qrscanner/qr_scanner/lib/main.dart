import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/services/scan_list_service.dart';

import 'screens/home_screen.dart';
import 'screens/map_screen.dart';
import 'services/ui_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  final Color primaryColor = const Color.fromARGB(255, 35, 88, 168);
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiService()),
        ChangeNotifierProvider(create: (_) => ScanListService())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Scanner',
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomeScreen(),
          'map': (_) => const MapScreen()
        },
        theme: ThemeData(
            primaryColor: primaryColor,
            appBarTheme: AppBarTheme(backgroundColor: primaryColor),
            floatingActionButtonTheme:
                FloatingActionButtonThemeData(backgroundColor: primaryColor),
            bottomNavigationBarTheme:
                BottomNavigationBarThemeData(selectedItemColor: primaryColor)),
      ),
    );
  }
}
