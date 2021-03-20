
import 'package:appdatn/pages/product_detail.dart';
import 'package:flutter/material.dart';
 

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  //danh sách ảo
  var product_list = [
    {
      "name": "Balenciaga track 2 ",
      "picture": "images/products/3.jpg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "B2 ",
      "picture": "images/products/4.jpg",
      "old_price": 150,
      "price": 100,
    },
    {
      "name": "B3 ",
      "picture": "images/products/5.jpg",
      "old_price": 230,
      "price": 185,
    },
    {
      "name": "N1 ",
      "picture": "images/products/6.jpg",
      "old_price": 1120,
      "price": 815,
    },
    {
      "name": "B4 ",
      "picture": "images/products/8.jpg",
      "old_price": 1320,
      "price": 985,
    },
    {
      "name": "B6 ",
      "picture": "images/products/8.jpg",
      "old_price": 1320,
      "price": 985,
    },
    {
      "name": "B7 ",
      "picture": "images/products/8.jpg",
      "old_price": 1320,
      "price": 985,
    },
    {
      "name": "B8 ",
      "picture": "images/products/8.jpg",
      "old_price": 1320,
      "price": 985,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Single_pro(
            product_name: product_list[index]['name'],
            product_images: product_list[index]['picture'],
            product_old_price: product_list[index]['old_price'],
            product_price: product_list[index]['price'],
          ),
        );
      },
    );
  }
}

class Single_pro extends StatelessWidget {
  final product_name;
  final product_images;
  final product_old_price;
  final product_price;

  Single_pro(
      {this.product_name,
      this.product_images,
      this.product_old_price,
      this.product_price});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 20.0,
      child: Hero(
        tag: product_name,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => new Product_Detail(
                      product_detail_name: product_name,
                      product_detail_new_price: product_price,
                      product_detail_old_price: product_old_price,
                      product_detail_picture: product_images,
                    ))),
            child: GridTile(
                footer: Container(
                    width: 360.0,
                    color: Colors.white54,
                    child: new Row(
                      children: <Widget>[
                        Expanded(
                          child: new Text(
                            product_name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                        ),
                        Text(
                          "\$ ${product_price}",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                child: Image.asset(
                  product_images,
                  fit: BoxFit.cover,
                )),
          ),
        ),
      ),
    );
  }
}
