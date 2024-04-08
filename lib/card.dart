import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  const MyCard({super.key});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(20),
          child: Card(
            elevation: 7,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    child: Image.asset("images/product.jpeg", fit: BoxFit.fill),
                  ),
                  SizedBox(height: 20),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Container(
                       height: 20,
                       child: Text("Product Name"),
                     ),
                     Container(
                       height: 20,
                       child: Text("Product Price"),
                     ),
                     Container(
                       height: 20,
                       child: Text("Product Cate"),
                     ),
                   ],
                 )
                ],
              ),
            ) ,
          ),
        );
      },),
    );
  }
}
