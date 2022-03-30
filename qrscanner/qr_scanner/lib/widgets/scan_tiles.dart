import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/utils/utils.dart';

import '../services/scan_list_service.dart';

class ScanTiles extends StatelessWidget {
  final String type;
  const ScanTiles({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListService = Provider.of<ScanListService>(context);
    final scans = scanListService.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, int i) => Dismissible(
        key: UniqueKey(),
        background: Container(color: Colors.red),
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListService>(context, listen: false)
              .deleteScanById(scans[i].id!);
        },
        child: ListTile(
          leading: Icon(type != 'http' ? Icons.map : Icons.link_rounded,
              color: Theme.of(context).primaryColor),
          title: Text(scans[i].value),
          subtitle: Text(scans[i].id.toString()),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: () => launchURL(context, scans[i]),
        ),
      ),
    );
  }
}
