import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing/pages/food/food_page.dart';
import 'package:testing/pages/profile/profile_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _subPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.amber.shade700,
        title: Text(
          _subPageIndex == 0 ? 'FLUTTER FOOD' : 'Profile',
          style: GoogleFonts.fredokaOne(),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          child: Image.asset('assets/images/profile.jpg'),
                        )),
                  ),
                  Text(
                    'Yanisa Churmorn',
                    style: GoogleFonts.righteous(
                        fontSize: 20.0, color: Colors.black),
                  ),
                  Text(
                    'Gardy_pg@gmail.com',
                    style: GoogleFonts.righteous(
                        fontSize: 12.0, color: Colors.black54),
                  ),
                ],
              ),
            ),
            ListTile(
              title: _buildDrawerItem(Icon(Icons.fastfood), 'Food'),
              onTap: () => _showSubPage(0),
              selected: _subPageIndex == 0,
            ),
            ListTile(
              title: _buildDrawerItem(Icon(Icons.person), 'Profile'),
              onTap: () => _showSubPage(1),
              selected: _subPageIndex == 1,
            ),
          ],
        ),
      ),
      body: _buildSubPage(),
    );
  }

  _showSubPage(int index) {
    setState(() {
      _subPageIndex = index;
    });
    Navigator.of(context).pop();
  }

  Widget _buildSubPage() {
    switch (_subPageIndex) {
      case 0:
        return FoodPage();
      case 1:
        return Profile();
      default:
        return SizedBox.shrink();
    }
  }

  Row _buildDrawerItem(Widget icon, String title) {
    return Row(
      children: [
        icon,
        SizedBox(width: 8.0),
        Text(
          title,
          style: GoogleFonts.fredokaOne(fontSize: 15.0, color: Colors.blueGrey),
        ),
      ],
    );
  }
}
