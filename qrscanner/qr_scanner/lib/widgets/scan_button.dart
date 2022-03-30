import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/utils/utils.dart';

import '../services/scan_list_service.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        onPressed: () async {
          // String scanRes = await FlutterBarcodeScanner.scanBarcode(
          //     '#3D8BEF', 'Cancelar', false, ScanMode.QR);
          const String scanRes = 'geo:19.322810,-99.215532';
          if (scanRes == '-1') return;
          final newScan =
              await Provider.of<ScanListService>(context, listen: false)
                  .newScan(scanRes);
          launchURL(context, newScan);
        },
        child: const Icon(Icons.filter_center_focus));
  }
}
