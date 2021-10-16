import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderPage extends StatelessWidget {
  static const routeName = '/order';

  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'YOUR ORDER',
          textAlign: TextAlign.center,
          style: GoogleFonts.fredokaOne(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey),
        ),
      ),
    );
  }
}
