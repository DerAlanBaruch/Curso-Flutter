import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(children: [
          _SingleCard(
              color: Colors.blue,
              icon: Icons.border_all_outlined,
              text: 'General'),
          _SingleCard(
              color: Colors.pinkAccent,
              icon: Icons.verified_user,
              text: 'Transport')
        ]),
        TableRow(children: [
          _SingleCard(color: Colors.green, icon: Icons.shop, text: 'Shopping'),
          _SingleCard(
              color: Colors.lime, icon: Icons.payment_outlined, text: 'Bill')
        ]),
        TableRow(children: [
          _SingleCard(
              color: Colors.redAccent, icon: Icons.movie, text: 'Entertaiment'),
          _SingleCard(
              color: Colors.pink, icon: Icons.verified_user, text: 'Transport')
        ]),
        TableRow(children: [
          _SingleCard(
              color: Colors.amber,
              icon: Icons.mail_outline_sharp,
              text: 'General'),
          _SingleCard(
              color: Colors.orange,
              icon: Icons.food_bank_outlined,
              text: 'Transport')
        ]),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  const _SingleCard(
      {Key? key, required this.icon, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CardBackground(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
            backgroundColor: color,
            child: Icon(
              icon,
              size: 35,
              color: Colors.white,
            ),
            radius: 30),
        const SizedBox(
          height: 20,
        ),
        Text(text, style: TextStyle(color: color, fontSize: 18))
      ],
    ));
  }
}

class _CardBackground extends StatelessWidget {
  final Widget child;
  const _CardBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(62, 66, 107, 0.3),
                borderRadius: BorderRadius.circular(20)),
            child: child,
          ),
        ),
      ),
    );
    ;
  }
}
