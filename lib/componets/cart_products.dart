
import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var Products_on_the_cart = [
    {
      "name": "Balenciaga track 2 ",
      "picture": "images/products/3.jpg",
      "price": 85,
      "size": "41",
      "color": "Red",
      "quanlity": 1,
    },
    {
      "name": "Balenciaga track 4 ",
      "picture": "images/products/8.jpg",
      "price": 185,
      "size": "42",
      "color": "Blu",
      "quanlity": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Products_on_the_cart.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
            cart_product_name: Products_on_the_cart[index]["name"],
            cart_product_color: Products_on_the_cart[index]["color"],
            cart_product_qly: Products_on_the_cart[index]["quanlity"],
            cart_product_size: Products_on_the_cart[index]["size"],
            cart_product_price: Products_on_the_cart[index]["size"],
            cart_product_images: Products_on_the_cart[index]['picture'],
          );
        });
  }

}

class Single_cart_product extends StatelessWidget {
  final cart_product_name;
  final cart_product_images;
  final cart_product_price;
  final cart_product_size;
  final cart_product_color;
  final cart_product_qly;

  Single_cart_product(
      {this.cart_product_name,
      this.cart_product_images,
      this.cart_product_price,
      this.cart_product_size,
      this.cart_product_color,
      this.cart_product_qly});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 10.0,
      child: ListTile(
        leading: new Image.asset(
          cart_product_images,
          width: 80.0,
          height: 80.0,
        ),
        title: new Text(cart_product_name),
        subtitle: new Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text("Size: "),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    cart_product_size,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: Text("Colors: "),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(cart_product_color),
                ),
              ],
            ),
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "\$ ${cart_product_price}",
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        trailing: new Column(
          children: <Widget>[
            new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: () {}),
            new Text("$cart_product_size"),
            new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
