import 'package:flutter/material.dart';
import 'package:notifications/screens/screens.dart';

import 'services/notifications_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationsService.initilizeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> keyNavigatorState =
      GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> keyScaffoldState =
      GlobalKey<ScaffoldMessengerState>();
  @override
  void initState() {
    super.initState();
    NotificationsService.messageStream.listen((message) {
      print('MyApp: $message');
      final snakBar = SnackBar(
        content: Text(message),
      );
      keyScaffoldState.currentState?.showSnackBar(snakBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        navigatorKey: keyNavigatorState,
        scaffoldMessengerKey: keyScaffoldState,
        routes: {
          'home': (_) => const HomeScreen(),
          'message': (_) => const MessageScreen()
        });
  }
}
