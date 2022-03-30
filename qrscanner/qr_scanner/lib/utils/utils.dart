import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/scan_model.dart';

void launchURL(BuildContext context, ScanModel scan) async {
  final _url = scan.value;
  if (scan.type == 'http') {
    if (await canLaunch(_url)) {
      launch(_url);
    }
  } else {
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}
