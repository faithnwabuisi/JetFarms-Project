import 'dart:async';
import 'package:farm2c/Module/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:farm2c/global_settings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isSeller = true;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const Onboarding(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    print(Offset(0.0, -1.0).distanceSquared - Offset(0.0, 0.0).distanceSquared);
    return Scaffold(
      // backgroundColor: appColor,
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 120.0),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  height: 125.0,
                  width: 125.0,
                  decoration: BoxDecoration(
                    //color: white,
                    borderRadius: BorderRadius.circular(50.0),
                    image: const DecorationImage(
                      image:
                          AssetImage('lib/assets/LOGO-darkgreen-notagline.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                // const SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Text(
                    'Trade agro markets with our traceability features',
                    style: TextStyle(
                      fontSize: globalHeading,
                      color: appColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 23.0, right: 23.0),
                  child: Text(
                    'powered by',
                    style: TextStyle(
                      fontSize: littleTexts,
                      color: globalInfoColor,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: 60.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    //color: white,
                    borderRadius: BorderRadius.circular(50.0),
                    image: const DecorationImage(
                      image: AssetImage('lib/assets/jetfarms logo.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
