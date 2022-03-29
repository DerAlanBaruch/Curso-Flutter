import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/screens/directions_screen.dart';
import 'package:qr_scanner/screens/maps_screen.dart';
import 'package:qr_scanner/services/db_service.dart';

import '../models/scan_model.dart';
import '../services/ui_service.dart';
import '../widgets/custom_navigatorbar.dart';
import '../widgets/scan_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: const _HomeScreenBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiService = Provider.of<UiService>(context);
    final currentIndex = uiService.selectedMenuOpt;
    //final tempScan = ScanModel(value: 'https://www.google.com');
    //DbService.db.deleteAllScans().then(print);
    switch (currentIndex) {
      case 0:
        return const MapsScreen();
      case 1:
        return const DirectionsScreen();
      default:
        return const MapsScreen();
    }
  }
}
