import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  void increase() {
    counter++;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  void setZero() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontSize = TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Text("CounterScreen"),
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Numero de Clicks',
              style: fontSize,
            ),
            Text('$counter', style: fontSize)
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: CustomActionButtons(
        incFn: increase,
        decFn: decrease,
        set0Fn: setZero,
      ),
    );
  }
}

class CustomActionButtons extends StatelessWidget {
  final Function incFn;
  final Function decFn;
  final Function set0Fn;
  const CustomActionButtons({
    Key? key, required this.incFn, required this.decFn, required this.set0Fn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.plus_one_rounded),
          onPressed: () => incFn(),
        ),
        FloatingActionButton(
          child: const Icon(Icons.exposure_zero),
          onPressed: () => set0Fn(),
        ),
        FloatingActionButton(
          child: const Icon(Icons.exposure_minus_1),
          onPressed: () => decFn(),
        ),
      ],
    );
  }
}
