import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing/model/menu.dart';
import 'package:testing/pages/food/foodlist_page.dart';
import 'package:testing/pages/food/order_page.dart';
import 'package:http/http.dart' as http;

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  var _selectedBottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      body: _selectedBottomNavIndex == 0 ? FoodListPage() : OrderPage(),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 15,
        selectedLabelStyle: GoogleFonts.fredokaOne(fontWeight: FontWeight.bold),
        backgroundColor: Colors.amber.shade700,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Your order',
          ),
        ],
        currentIndex: _selectedBottomNavIndex,
        fixedColor: Colors.white,
        unselectedItemColor: Colors.amber.shade100,
        unselectedLabelStyle: GoogleFonts.fredokaOne(),
        onTap: (index) {
          setState(() {
            _selectedBottomNavIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _test,
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _test() async {
    var url = Uri.parse('https://cpsu-test-api.herokuapp.com/foods');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = json.decode(response.body);
      String status = jsonBody['status'];
      String? message = jsonBody['message'];
      List<dynamic> data = jsonBody['data'];

      print('STATUS: $status');
      print('MESSAGE: $message');
      //print('data: $data');

      var foodList = data.map((element) => FoodItem(
          id: element['id'],
          name: element['name'],
          price: element['price'],
          image: element['image'],
      )).toString();

      // data.forEach((element) {
      //   FoodItem(
      //     id: element['id'],
      //     name: element['name'],
      //     price: element['price'],
      //     image: element['image'],
      //   );
      // });
    } else {}
  }
}
