import 'package:flutter/material.dart';
import 'package:widget_app/models/models.dart';
import 'package:widget_app/screens/screens.dart';

class AppRoutes {
  static const initialRoutes = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'home',
        name: 'Home Screen',
        screen: const HomeScreen(),
        icon: Icons.home),
    MenuOption(
        route: 'listview1',
        name: 'ListView tipo 1',
        screen: const ListView1Screen(),
        icon: Icons.list),
    MenuOption(
        route: 'listview2',
        name: 'ListView tipo 2',
        screen: const ListView2Screen(),
        icon: Icons.list_alt),
    MenuOption(
        route: 'alert',
        name: 'Alert Screen',
        screen: const AlertScreen(),
        icon: Icons.add_alert),
    MenuOption(
        route: 'card',
        name: 'Card Screen',
        screen: const CardScreen(),
        icon: Icons.card_membership_sharp)
  ];

  static Map<String, Widget Function(BuildContext)> getMenuRoutes(){
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    for(final option in menuOptions){
      appRoutes.addAll(
        {option.route : ((BuildContext context) => option.screen)}
      );
    }
    return appRoutes;
  }

  static Map<String, Widget Function(BuildContext)> routes = {
    'home': (BuildContext context) => const HomeScreen(),
    'listview1': (BuildContext context) => const ListView1Screen(),
    'listview2': (BuildContext context) => const ListView2Screen(),
    'alert': (BuildContext context) => const AlertScreen(),
    'card': (BuildContext context) => const CardScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const ListView2Screen());
  }
}
