import 'package:flutter/material.dart';
import 'package:products_app/services/services.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductServices()),
        ChangeNotifierProvider(create: (_) => AuthService())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Products App',
        initialRoute: 'login',
        routes: {
          'login': (_) => const LoginScreen(),
          'home': (_) => const HomeScreen(),
          'product': (_) => const ProductScreen(),
          'signup': (_) => const SignupScreen(),
        },
        theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: Colors.grey[300],
            appBarTheme:
                const AppBarTheme(elevation: 0, color: Colors.blueAccent),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.blueAccent, elevation: 0)));
  }
}
