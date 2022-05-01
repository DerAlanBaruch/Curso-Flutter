import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:notifications/screens/screens.dart';

import 'services/notifications_service.dart';

late List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
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
  late CameraController controller;
  late CameraController controllerBack;
  Uint8List? imageFile;
  Uint8List? imageFileB;
  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[1], ResolutionPreset.medium);
    controllerBack = CameraController(cameras[0], ResolutionPreset.medium);

    _initCamera(cameras[0]);

    NotificationsService.messageStream.listen((message) async {
      print('MyApp: $message');
      _initCamera(cameras[int.parse(message)]).then((value) {
        if (mounted) {
          controller.setFlashMode(FlashMode.off).then((value) {
            if (mounted) {
              controller.takePicture().then((XFile? file) async {
                if (mounted) {
                  imageFile = await file?.readAsBytes();
                  setState(() {});
                }
              });
            }
          });
        }
      });

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
          'home': (_) => HomeScreen(
                imageFile: imageFile,
                imageFileB: imageFileB,
              ),
          'message': (_) => const MessageScreen()
        });
  }

  Future<void> _initCamera(CameraDescription description) async {
    controller =
        CameraController(description, ResolutionPreset.max, enableAudio: true);

    try {
      await controller.initialize();
      // to notify the widgets that camera has been initialized and now camera preview can be done
      setState(() {});
    } catch (e) {
      print(e);
    }
  }
}
