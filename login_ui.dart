import 'package:farm2c/admin%20area/dashboard.dart';
import 'package:farm2c/global_settings.dart';
import 'package:farm2c/shared_preference.dart';
import 'package:farm2c/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unicons/flutter_unicons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  //SELLERS LIST
  // List forSellers;
  List forSellersJson;

  LoginForm({
    Key? key,
    // required this.forSellers,
    required this.forSellersJson,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  // List sellers = [];

  String initialUser = 'admin';
  String initialPass = '1234';

  bool isLoggedIn = false;

  Future getTheSeller() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    List<dynamic>? sellers = _preferences.getStringList('clist');
    if (sellers == null) return;
    return sellers;
  }

  @override
  void initState() {
    super.initState();

    getTheSeller();
    checkUserLoginStatus();
    isLoggedIn = SaveInputs.fetchCondition() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Unicon(Unicons.uniArrowLeft,
              size: bigHeader, color: globalDefault, fit: BoxFit.contain),
        ),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: textFieldWidget(),
        ),
      ),
    );
  }

  Widget textFieldWidget() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50.0,
              width: 50.0,
              child: const Image(
                image: AssetImage('lib/assets/ICON.png'),
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Farm Manager Login',
              style: TextStyle(
                color: globalDefault,
                fontSize: bigHeader,
                fontWeight: FontWeight.w700,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 50.0),
            TextFormField(
              style: TextStyle(
                fontSize: globalHeading,
                color: globalDefault,
              ),
              cursorColor: appColor,
              decoration: InputDecoration(
                hintText: 'username',
                hintStyle: TextStyle(
                  fontSize: globalHeading,
                  color: globalDefault,
                ),
              ),
              validator: (value) {
                if (value != initialUser || value!.length < 4) {
                  return "Username not correct";
                } else {
                  return null;
                }
              },
              onSaved: (value) => setState(() => initialUser = value!),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              style: TextStyle(
                fontSize: globalHeading,
                color: globalDefault,
              ),
              cursorColor: appColor,
              decoration: InputDecoration(
                hintText: 'password',
                hintStyle: TextStyle(
                  fontSize: globalHeading,
                  color: globalDefault,
                ),
              ),
              validator: (value) {
                if (value != initialPass || value!.length < 4) {
                  return "Incorrect password";
                } else {
                  return null;
                }
              },
              onSaved: (value) => setState(() => initialPass = value!),
            ),
            const SizedBox(height: 40.0),
            ButtonWidget(
              text: 'Dashboard',
              btnColor: appColor,
              txtColor: white,
              onClicked: () async {
                final isValid = formKey.currentState!.validate();
                if (isValid) {
                  formKey.currentState!.save();

                  await SaveInputs.isLoggedIn(isLoggedIn);
                  // if (sellers == null) return print('sellers empty');
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => Dashboard(
                      forSellersJson: SaveInputs.hassSellers,
                    ), //was homescreen before
                  ));
                } else {
                  final snackBar = SnackBar(
                    backgroundColor: appColor,
                    content: Text(
                      'Incorrect credentials',
                      style: TextStyle(
                        color: white,
                        fontSize: globalTagline,
                      ),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

}//state close
