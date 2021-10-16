import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  static const routeName = '/profile';

  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/0002.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(90.0),
                  child: Container(
                    width: 150.0,
                    height: 150.0,
                    child: Image.asset('assets/images/profile.jpg'),
                  )),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'Yanisa Churmorn',
                style: GoogleFonts.righteous(
                    fontSize: 30.0,
                    color: Colors.deepOrange.shade300,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Gardy_pg@gmail.com',
                style: GoogleFonts.fredokaOne(
                    fontSize: 20.0, color: Colors.cyan.shade600),
              ),
              SizedBox(
                height: 35.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
