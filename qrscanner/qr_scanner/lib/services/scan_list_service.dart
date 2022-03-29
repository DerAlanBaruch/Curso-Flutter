import 'package:flutter/material.dart';

import '../models/scan_model.dart';
import 'db_service.dart';

class ScanListService extends ChangeNotifier {
  List<ScanModel> scans = [];
  String selectedType = 'http';

  newScan(String value) async {
    final newScan = ScanModel(value: value);
    final id = await DbService.db.newScan(newScan);
    newScan.id = id;
    if (selectedType == newScan.type) {
      scans.add(newScan);
      notifyListeners();
    }
  }

  loadScans() async {
    final data = await DbService.db.getScans();
    scans = (data != null ? [...data] : null)!;
    notifyListeners();
  }

  loadScansByType(String type) async {
    final data = await DbService.db.getScansByType(type);
    scans = (data != null ? [...data] : null)!;
    selectedType = type;
    notifyListeners();
  }

  deleteAllScans() async {
    await DbService.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }

  deleteScanById(int id) async {
    await DbService.db.deleteScan(id);
    loadScansByType(selectedType);
    notifyListeners();
  }
}
