import 'package:flutter/material.dart';
import 'package:login_page/loginScreen.dart';
//import 'package:login_page/main.dart';
import 'package:login_page/productScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4CD137),
        title: Row(
          children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Welcome,',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ' Ankith',
                  style: TextStyle(fontFamily: 'poppins', fontSize: 25),
                )
              ]),
            )
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: Colors.white),
              label: Text(
                'Log Out',
                style: TextStyle(color: Colors.black, fontSize: 13),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx1) {
                    return AlertDialog(
                      backgroundColor: Color(0xFFFFFFFF),
                      title: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Are you sure you want \n to Logout? ',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                width: 100,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(76, 209, 55, 1),
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 30, top: 3),
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 237, 240, 237),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                logout(context);
                              },
                              child: Container(
                                height: 40,
                                width: 100,
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 34, top: 3),
                                  child: Text(
                                    'Yes',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  },
                );
              },
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(14),
            child: Text(
              "Our Product",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 1,
                mainAxisExtent: 250,
              ),
              children: [
                products(context),
                products(context),
                products(context),
                products(context),
                products(context),
                products(context),
                products(context),
                products(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  products(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProductScreen()));
      },
      child: Card(
        shadowColor: Color.fromARGB(62, 69, 66, 66),
        color: Color.fromARGB(62, 187, 185, 185),
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              SizedBox(
                height: 177,
                width: 207,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/images/tshirt.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "merino short sleeve\n base layer tee",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "\$19.99",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}

logout(BuildContext context) async {
  final _sharedPrefs = await SharedPreferences.getInstance();
  await _sharedPrefs.clear();
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => Login()), (route) => false);
}
