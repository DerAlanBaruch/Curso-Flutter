import 'package:flutter/material.dart';
import 'package:widget_app/themes/app_theme.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderEnable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Sliders and Checks')),
        body: Column(
          children: [
            Slider.adaptive(
                min: 50,
                max: 1000,
                activeColor: AppTheme.primary,
                divisions: 10,
                value: _sliderValue,
                onChanged: _sliderEnable
                    ? (value) {
                        _sliderValue = value;
                        setState(() {});
                      }
                    : null),
            CheckboxListTile(
                title: const Text('Habilitar Slider'),
                activeColor: AppTheme.primary,
                value: _sliderEnable,
                onChanged: (value) => setState(() {
                      _sliderEnable = value ?? true;
                    })),
            SwitchListTile.adaptive(
                title: const Text('Habilitar Slider'),
                activeColor: AppTheme.primary,
                value: _sliderEnable,
                onChanged: (value) => setState(() {
                      _sliderEnable = value;
                    })),
            const AboutListTile(),
            Expanded(
              child: SingleChildScrollView(
                child: Image.network(
                    'https://w7.pngwing.com/pngs/270/98/png-transparent-cat-kitten-balloon-birthday-graphy-cats-mammal-hat-cat-like-mammal-thumbnail.png',
                    fit: BoxFit.contain,
                    width: _sliderValue),
              ),
            ),
          ],
        ));
  }
}
