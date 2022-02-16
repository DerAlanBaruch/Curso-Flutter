import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatars'),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 5),
              child: const CircleAvatar(
                child: Text('SL'),
                backgroundColor: Colors.indigo,
              ))
        ],
      ),
      body: const Center(
        child: CircleAvatar(
          maxRadius: 110,
          backgroundImage: NetworkImage('https://zoku.com.mx/assets/media/ZokuPrinc3-02.webp'),
          backgroundColor: Colors.indigo,
        ),
      ),
    );
  }
}
