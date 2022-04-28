import 'package:flutter/material.dart';

class NotificationService {
  static late GlobalKey<ScaffoldMessengerState> messageKey =
      GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(String message) {
    final snackbar = SnackBar(
      content: Text(message,
          style: const TextStyle(color: Colors.white, fontSize: 20)),
    );
    messageKey.currentState!.showSnackBar(snackbar);
  }
}
