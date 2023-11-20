//import 'dart:math';

import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';

class ProductScreen extends StatefulWidget {
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  _ProductScreenState() {
    _selectedVal = _productSizeList[0];
  }
  final _productSizeList = ["M", "S", "L", "XL"];

  String _selectedVal = "L";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4CD137),
        title: Text(
          'Product Screen',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'poppins',
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 231, 228, 228),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              width: 400,
              height: 400,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/images/tshirt.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Divider(
              color: Colors.white,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Merino Short Sleeve\n Base Layer Tee',
                          style: TextStyle(fontSize: 20, fontFamily: 'poppins'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 100),
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.black),
                            ),
                            child: DropdownButton(
                                value: _selectedVal,
                                items: _productSizeList
                                    .map(
                                      (e) => DropdownMenuItem(
                                        child: Text(e),
                                        value: e,
                                      ),
                                    )
                                    .toList(),
                                onChanged: (Val) {
                                  setState(() {
                                    _selectedVal = Val.toString();
                                  });
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      width: 380,
                      height: 155,
                      child: Text(
                        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more or less normal distribution of letters, as opposed to using",
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        minimumSize: Size(100, 50),
                        backgroundColor: Color(
                          0xFF4CD137,
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("Buy Now \$19.99")],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
