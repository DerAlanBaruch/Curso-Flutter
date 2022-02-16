import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  late double _width = 50;
  late double _height = 50;
  late Color _color = Colors.indigoAccent;
  late BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  void changeShape() {
    final random = Random();
    _height = 50.0 + random.nextInt(100);
    _width = 50.0 + random.nextInt(100);
    _borderRadius = BorderRadius.circular(20 * random.nextDouble() + 5);
    _color = Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container')),
      body: Center(
        child: AnimatedContainer(
          decoration: BoxDecoration(color: _color, borderRadius: _borderRadius),
          width: _width,
          height: _height,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_circle_fill_rounded, size: 35),
        onPressed: () => {changeShape()},
      ),
    );
  }
}
