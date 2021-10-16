import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing/model/menu.dart';

class Detail extends StatelessWidget {
  //static const routeName = '/detail';
  const Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = ModalRoute.of(context)!.settings.arguments as FoodItem;

    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      appBar: AppBar(
        backgroundColor: Colors.amber.shade700,
        title: Text(item.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/images/${item.image}'),
          )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text("$item",
                  style: GoogleFonts.mali(fontSize: 20.0, color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
