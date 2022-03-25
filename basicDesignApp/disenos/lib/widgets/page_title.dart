import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Clasify Transaction',
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.normal,
              )),
          const SizedBox(height: 10),
          Text('Clasify this transaction into a particular category',
              style: GoogleFonts.poppins(
                fontSize: 20,
              ))
        ]),
      ),
    );
  }
}
