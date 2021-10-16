import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing/model/menu.dart';

class FoodListPage extends StatefulWidget {
  const FoodListPage({Key? key}) : super(key: key);

  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  var items = [
    FoodItem(
      id: 1,
      name: 'ข้าวไข่เจียว',
      price: 25,
      image: 'kao_kai_jeaw.jpg',
    ),
    FoodItem(
      id: 2,
      name: 'ข้าวหมูแดง',
      price: 30,
      image: 'kao_moo_dang.jpg',
    ),
    FoodItem(
      id: 3,
      name: 'ข้าวมันไก่',
      price: 30,
      image: 'kao_mun_kai.jpg',
    ),
    FoodItem(
      id: 4,
      name: 'ข้าวหน้าเป็ด',
      price: 40,
      image: 'kao_na_ped.jpg',
    ),
    FoodItem(
      id: 5,
      name: 'ข้าวผัด',
      price: 30,
      image: 'kao_pad.jpg',
    ),
    FoodItem(
      id: 6,
      name: 'ผัดซีอิ๊ว',
      price: 30,
      image: 'pad_sie_eew.jpg',
    ),
    FoodItem(
      id: 7,
      name: 'ผัดไทย',
      price: 35,
      image: 'pad_thai.jpg',
    ),
    FoodItem(
      id: 8,
      name: 'ราดหน้า',
      price: 30,
      image: 'rad_na.jpg',
    ),
    FoodItem(
      id: 9,
      name: 'ส้มตำไก่ย่าง',
      price: 80,
      image: 'som_tum_kai_yang.jpg',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                goDetail(items[index]);
              },
              child: Card(
                margin: const EdgeInsets.all(8.0),
                elevation: 0.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // if you need this
                  side: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          child: Image.asset(
                              'assets/images/${items[index].image}',
                              width: 70.0,
                              height: 70.0,
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: 13.0,
                      ),
                      Text('${items[index].name}\n${items[index].price} บาท',
                          style: GoogleFonts.righteous(
                              fontSize: 20.0, color: Colors.black)),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  void goDetail(FoodItem item) {
    Navigator.pushNamed(
      context,
      "/detail",
      arguments: item,
    );
  }
}
