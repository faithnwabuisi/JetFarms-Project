import 'dart:async';
import 'package:farm2c/Module/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:farm2c/global_settings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => const HomeScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    print(Offset(0.0, -1.0).distanceSquared - Offset(0.0, 0.0).distanceSquared);
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(5.0),
              height: 80.0,
              width: 80.0,
              decoration: BoxDecoration(
                //color: white,
                borderRadius: BorderRadius.circular(50.0),
                image: const DecorationImage(
                  image: AssetImage('lib/assets/logo-jtf.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Text(
              'Farm2C',
              style: TextStyle(
                fontSize: bigHeader,
                color: appColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 23.0, right: 23.0),
              child: Text(
                'A technology driven startup committed to innovation and sustainability in the agricultural sector',
                style: TextStyle(
                  fontSize: BtnFnt2,
                  color: appColor,
                  height: 1.4,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
