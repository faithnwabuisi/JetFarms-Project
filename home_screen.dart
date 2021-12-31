import 'package:farm2c/Module/commodity.dart';
import 'package:farm2c/global_settings.dart';
import 'package:farm2c/widgets/home_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unicons/flutter_unicons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        title: Text(
          appName,
          style: TextStyle(
            fontSize: globalHeading,
            color: white,
          ),
        ),
      ),
      //),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(
                color: appColor,
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4), BlendMode.darken),
                  image: AssetImage('lib/assets/image1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 50.0),
            //UI 1
            homeWidget(
              widget,
              image: 'lib/assets/icon9.png',
              title: 'Commodity',
              link: Unicons.uniLink,
              color: Colors.transparent,
              subtitle: 'Become a buyer or seller with $appName',
              clicked: () {
                Navigator.pushNamed(context, '/commodity');
              },
            ),

            const SizedBox(height: 15.0),
            homeWidget(
              widget,
              image: 'lib/assets/icon7.png',
              title: 'Investment',
              link: Unicons.uniExternalLinkAlt,
              color: globalInfoColor,
              subtitle: 'Learn about our investment plan and strategy',
              clicked: () {
                urlOut("https://jetfarmsng.com", false);
              },
            ),
            const SizedBox(height: 15.0),
            homeWidget(
              widget,
              image: 'lib/assets/icon8.png',
              title: 'Farm Advisory',
              link: Unicons.uniLink,
              color: Colors.transparent,
              subtitle:
                  'Need help? Get in touch with one of our expert advicers',
              clicked: () {},
            ), //UI 1 END HERE

            const SizedBox(height: 10.0),
            Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 15.0),
              child: Text(
                'Let us know what area you need our help. Select an option to start',
                style: TextStyle(
                  fontSize: littleTexts,
                  color: globalInfoColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              drawerHeader(),
              const SizedBox(height: 20.0),
              buildMenuItem(
                text: 'Invest',
                unicon: Unicons.uniExternalLinkAlt,
                onClicked: () => selectedItem(context, 0),
              ),

              //SizedBox(height: 25.0),
              buildMenuItem(
                text: 'About us',
                unicon: Unicons.uniInfoCircle,
                onClicked: () => selectedItem(context, 1),
              ),
              //SizedBox(height: 15.0),
              buildMenuItem(
                text: 'Rate app',
                unicon: Unicons.uniStar,
                onClicked: () => selectedItem(context, 2),
              ),

              Divider(color: globalInfoColor),
              footer(),
            ],
          ),
        ),
      ),
    );
  }

//DRAWER HEADER
  Widget drawerHeader() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        width: double.infinity,
        height: 250.0,
        decoration: BoxDecoration(
          color: white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(flex: 6, child: Container()),
                  Expanded(
                    flex: 3,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Unicon(
                        Unicons.uniArrowLeft,
                        size: homeIcon,
                        color: appColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.only(left: 10.0, bottom: 15.0),
                height: 80.0,
                width: 190.0,
                decoration: BoxDecoration(
                  color: white,
                  image: DecorationImage(
                    image: AssetImage(
                        'lib/assets/jetfarms logo.png'), //use the real logo here... i.e. the complete full logo
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                'We sell Investable farms to our prospective investment partners',
                style: TextStyle(
                  fontSize: globalTagline,
                  color: appColor,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//Footer Widget
  Widget footer() {
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Follow us on:',
            style: TextStyle(
              color: globalInfoColor,
              fontSize: littleTexts,
            ),
          ),
          const SizedBox(height: 5.0),
          Container(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    facebook("https://www.facebook.com/jetfarmsng", false);
                  },
                  icon: Unicon(
                    Unicons.uniFacebookF,
                    size: leadingIcons,
                    color: appColor,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 10.0),
                IconButton(
                  onPressed: () {
                    instagram(
                        "https://instagram.com/jetfarmsng?igshid=185jbfobwpxw2",
                        false);
                  },
                  icon: Unicon(
                    Unicons.uniInstagram,
                    size: leadingIcons,
                    color: appColor,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 10.0),
                IconButton(
                  onPressed: () {
                    twitter("https://twitter.com/jetfarmsng?s=08", false);
                  },
                  icon: Unicon(
                    Unicons.uniTwitterAlt,
                    size: leadingIcons,
                    color: appColor,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//DRAWER MENU ITEM WIDGET
  Widget buildMenuItem({
    required String text,
    required UniconData unicon,
    VoidCallback? onClicked,
  }) {
    //final color = globalDefault;
    return Material(
      child: InkWell(
        onTap: onClicked,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Unicon(
                  unicon,
                  animationDuration: Duration(milliseconds: 300),
                  animationCurve: Curves.fastOutSlowIn,
                  mainAxisAlignment: MainAxisAlignment.start,
                  size: leadingIcons,
                  color: globalDefault,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: BtnFnt1,
                    color: globalDefault,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//SELECTED ITEM ACTION
  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        urlOut("https://jetfarmsng.com", false);
        break;
      case 1:
        Navigator.pushNamed(context, '/about_us');
        break;
      case 2:
        rateApp("#com.farm2c.playstorelink", false);
        break;
    }
  }

  //Link Out
  Future urlOut(String url, bool inApp) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: inApp,
        forceWebView: inApp,
        enableJavaScript: true,
      );
    }
  }

  //Link Out - Facebook
  Future facebook(String urlF, bool inApp) async {
    if (await canLaunch(urlF)) {
      await launch(
        urlF,
        forceSafariVC: inApp,
        forceWebView: inApp,
        enableJavaScript: true,
      );
    }
  }

  //Link Out - Instagram
  Future instagram(String urlI, bool inApp) async {
    if (await canLaunch(urlI)) {
      await launch(
        urlI,
        forceSafariVC: inApp,
        forceWebView: inApp,
        enableJavaScript: true,
      );
    }
  }

  //Link Out - Twitter
  Future twitter(String urlT, bool inApp) async {
    if (await canLaunch(urlT)) {
      await launch(
        urlT,
        forceSafariVC: inApp,
        forceWebView: inApp,
        enableJavaScript: true,
      );
    }
  }

  //PlayStore Rating
  Future rateApp(String urlR, bool inApp) async {
    if (await canLaunch(urlR)) {
      await launch(
        urlR,
        forceSafariVC: inApp,
        forceWebView: inApp,
        enableJavaScript: true,
      );
    }
  }
} // State closes here
