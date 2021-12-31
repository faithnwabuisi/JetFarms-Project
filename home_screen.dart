import 'package:farm2c/Module/commodity.dart';
import 'package:farm2c/global_settings.dart';
import 'package:farm2c/widgets/button_widget.dart';
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
        //toolbarHeight: MediaQuery.of(context).size.height / 6,
        backgroundColor: appColor,
        elevation: 0,
        //shape: RoundedRectangleBorder(
        //borderRadius: BorderRadius.vertical(
        //bottom: new Radius.elliptical(60.0, 40.0),
        //),
        //),
        title: Text(
          'Farm2C',
          style: TextStyle(
            fontSize: globalHeading,
            color: white,
          ),
        ),
      ),
      //),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              color: appColor,
              image: DecorationImage(
                image: AssetImage('lib/assets/image2.jpg'),
                fit: BoxFit.cover,
              ),
              backgroundBlendMode: BlendMode.darken,
              //b/ackgroundBlendMode: BlendMode.darken,
            ),
          ),
          const SizedBox(height: 50.0),
          homeWidget(
            image: 'lib/assets/icon9.png',
            widget: ButtonWidget(
              widget,
              text: 'Commodity',
              onClicked: () {},
              txtColor: appColor,
              btnColor: white,
            ),
            title: 'Commodity',
          ),
          const SizedBox(height: 30.0),
          homeWidget(
            image: 'lib/assets/icon7.png',
            widget: ButtonWidget(
              widget,
              text: 'Investment',
              onClicked: () {},
              txtColor: appColor,
              btnColor: white,
            ),
            title: 'Investment',
          ),
          const SizedBox(height: 30.0),
          homeWidget(
            image: 'lib/assets/icon8.png',
            widget: ButtonWidget(
              widget,
              text: 'Farm Advisory',
              onClicked: () {},
              txtColor: appColor,
              btnColor: white,
            ),
            title: 'Farm Advisory',
          ),
          const SizedBox(height: 35.0),
          Padding(
            padding: const EdgeInsets.only(left: 35.0, right: 35.0),
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
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              drawerHeader(),
              SizedBox(height: 20.0),
              buildMenuItem(
                text: 'Favorites',
                unicon: Unicons.uniHeart,
                onClicked: () => selectedItem(context, 0),
              ),

              //SizedBox(height: 25.0),
              buildMenuItem(
                text: 'About us',
                unicon: Unicons.uniInfoCircle,
                onClicked: () => selectedItem(context, 3),
              ),
              //SizedBox(height: 15.0),
              buildMenuItem(
                text: 'Rate app',
                unicon: Unicons.uniStar,
                onClicked: () => selectedItem(context, 4),
              ),

              Divider(color: globalInfoColor),
              footer(),
            ],
          ),
        ),
      ),
    );
  }

//Home Widget
  Widget homeWidget({
    required String image,
    //required AssetImage img,
    required String title,
    required ButtonWidget widget,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(image),
          height: 50.0,
          width: 50.0,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 15.0),
        ButtonWidget(
          widget,
          onClicked: () {},
          text: title,
          btnColor: appColor,
          txtColor: white,
        ),
      ],
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
          borderRadius: BorderRadius.only(
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
                //mainAxisAlignment: MainAxisAlignment.start,
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
                padding: EdgeInsets.only(left: 10.0, bottom: 15.0),
                height: 80.0,
                width: 190.0,
                decoration: BoxDecoration(
                  color: white,
                  //borderRadius: BorderRadius.circular(0.0),
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
          SizedBox(height: 5.0),
          Container(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Unicon(
                    Unicons.uniFacebookF,
                    size: leadingIcons,
                    color: appColor,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 10.0),
                IconButton(
                  onPressed: () {},
                  icon: Unicon(
                    Unicons.uniInstagram,
                    size: leadingIcons,
                    color: appColor,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 10.0),
                IconButton(
                  onPressed: () {},
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
          padding: EdgeInsets.all(15.0),
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
        //return OpenSavedWords();
        Navigator.pushNamed(context, '/open_saved');
        break;
      case 1:
        Navigator.pushNamed(context, '/note_list');
        break;
      case 2:
        Navigator.pushNamed(context, '/theme_mode');
        break;
      case 3:
        Navigator.pushNamed(context, '/about_365');
        break;
      case 4:
        Navigator.pushNamed(context, '/rating');
        break;
    }
  }
} // State closes here
