import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_app/themes/app_theme.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogAndroid(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: const Text('Titulo'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('Esta es una alerta de contenido'),
                  SizedBox(
                    height: 10,
                  ),
                  FlutterLogo(
                    size: 100,
                  )
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancelar')),
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Ok'))
              ]);
        });
  }

  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
              // elevation: 5,
              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              title: const Text('Titulo'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('Esta es una alerta de contenido'),
                  SizedBox(
                    height: 10,
                  ),
                  FlutterLogo(
                    size: 100,
                  )
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancelar')),
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Ok'))
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () => {
                  Platform.isAndroid
                      ? displayDialogAndroid(context)
                      : displayDialogIOS(context)
                },
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Text('Mostrar Alerta', style: TextStyle(fontSize: 16)),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.primary,
        child: const Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
