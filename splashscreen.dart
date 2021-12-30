// import 'dart:async';
import 'package:farm2c/Module/home_screen.dart';
import 'package:farm2c/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:farm2c/global_settings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(Duration(seconds: 10000), () {
  //     // Navigator.of(context).pushReplacement(
  //     //   MaterialPageRoute(builder: (_) => LoginUI())
  //     //   );
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(
  //       builder: (BuildContext context) => HomeScreen(),
  //     ));

  //     // Navigator.of(context).pushReplacement(CustomPageRoute(
  //     //   child: BTNav(
  //     //     newIndex: 0,
  //     //   ),
  //     //   direction: AxisDirection.right,
  //     // ));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    //print(Offset(0.0, -1.0).distanceSquared - Offset(0.0, 0.0).distanceSquared);
    return Scaffold(
      backgroundColor: appColor,
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              height: 430.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: white,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(70.0),
                  bottomLeft: Radius.circular(70.0),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20.0),
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
                            fontSize: icon3Size,
                            color: appColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          'A technology driven startup committed to innovation and sustainability in the agricultural sector',
                          style: TextStyle(
                            fontSize: BtnFnt2,
                            color: appColor,
                            height: 1.4,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50.0),
            ButtonWidget(
              widget,
              text: 'Continue',
              onClicked: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => const HomeScreen(),
                ));
              },
              txtColor: appColor,
              btnColor: white,
            ),
          ],
        ),
      ),
    );
  }
}
