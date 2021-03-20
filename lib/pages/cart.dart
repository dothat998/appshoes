import 'package:appdatn/componets/cart_products.dart';
import 'package:flutter/material.dart';
 

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.2,
        backgroundColor: Colors.red,
        title: new Text("Cart"),
        centerTitle: true,
      ),
      //==============body=============
      body: CartProducts(),
      //========== Bottom==============
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
                child: ListTile(
              title: Text("Total  "),
              subtitle: Text("\$230"),
            )),
            Expanded(
                child: new MaterialButton(
              onPressed: () {},
              child: new Text(
                "Check Out",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
            )),
          ],
        ),
      ),
    );
  }
}
