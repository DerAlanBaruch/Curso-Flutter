import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
  const BasicDesignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Image(
            image: AssetImage('assets/Landscape-Photography-steps.jpg'),
          ),
          const Title(),
          const ButtonSection(),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: const Text(
                'Reprehenderit id laborum dolor tempor excepteur veniam sunt magna. Tempor cupidatat veniam deserunt ullamco exercitation et ad magna. Ea consectetur do id Lorem elit do velit amet ad esse. Minim enim sint nulla irure minim consectetur. Eiusmod consequat proident pariatur in nostrud et ipsum fugiat cupidatat eiusmod occaecat deserunt. Est amet aliqua occaecat ut exercitation anim consequat excepteur reprehenderit dolore eiusmod incididunt. Minim eiusmod ad Lorem dolor in amet culpa et.'),
          )
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          CustomButton(
            icon: Icons.call,
            text: 'CALL',
          ),
          CustomButton(
            icon: Icons.alt_route,
            text: 'ROUTE',
          ),
          CustomButton(
            icon: Icons.share,
            text: 'SHARE',
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color primaryColor = Colors.lightBlue;
  const CustomButton({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Icon(
        icon,
        color: primaryColor,
      ),
      Text(text, style: TextStyle(color: primaryColor))
    ]);
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Oeschinen Lake Campground',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Kandersteng, Switzerland',
                style: TextStyle(color: Colors.black45))
          ],
        ),
        Row(
          children: const [Icon(Icons.star, color: Colors.red), Text('41')],
        )
      ]),
    );
  }
}
