import 'package:flutter/material.dart';
import 'package:login_page/homeScreen.dart';
import 'package:login_page/main.dart';
import 'package:login_page/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Login extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  String username = "123";
  String password = "123";
  final _userNameControler = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 250, 249),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Color.fromARGB(255, 235, 241, 246),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      ' Please Login\n To continue  ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 7, 7, 7),
                        fontSize: 25,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                      child: CircleAvatar(
                        radius: 70,
                        child: Icon(
                          Icons.person,
                          size: 130,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                width: 428,
                height: 789,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x994CD137),
                      Color(0xD984D137),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Form(
                        key: formkey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 30),
                          width: 360,
                          height: 80,
                          child: TextFormField(
                            controller: _userNameControler,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFE1E1E1),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                hintText: "Username"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter  username";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 40),
                          width: 360,
                          height: 80,
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFE1E1E1),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                hintText: "Password"),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter  password";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Form(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 100),
                          width: 360,
                          height: 67,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black),
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                checkLogin(context);
                              } else {
                                print("data Empty");
                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontFamily: 'poppins', fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final _username = _userNameControler.text;
    final _password = _passwordController.text;
    if (_username == username && _password == password) {
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SAVE_KEY_NAME, true);
      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => Homescreen()));
    } else {
      ScaffoldMessenger.of(ctx)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text("Username Password doesn't Match"),
            duration: Duration(microseconds: 20),
          ),
        );
    }
  }
}
