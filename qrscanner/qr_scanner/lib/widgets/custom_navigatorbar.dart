import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/ui_service.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiService = Provider.of<UiService>(context);
    final currentIndex = uiService.selectedMenuOpt;
    return BottomNavigationBar(
      onTap: (int i) => uiService.selectedMenuOpt = i,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Mapa'),
        BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration), label: 'Direcciones'),
      ],
      elevation: 0,
      currentIndex: currentIndex,
    );
  }
}
