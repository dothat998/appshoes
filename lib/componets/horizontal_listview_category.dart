import 'package:flutter/material.dart';
class HorizontalListCategory extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      //Danh sách các category
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            images_location: 'images/brands/adidas.jpg',
            images_caption: "Adidas",
          ),
          Category(
            images_location: 'images/brands/nike.jpg',
            images_caption: "NIKE",
          ),
          Category(
            images_location: 'images/brands/balenciaga.jpg',
            images_caption: "Balenciaga",
          ),
          Category(
            images_location: 'images/brands/jordan.jpg',
            images_caption: "Jordan",
          ),
          Category(
            images_location: 'images/brands/new.jpg',
            images_caption: "New Balance",
          ),
          Category(
            images_location: 'images/brands/puma.jpg',
            images_caption: "Puma",
          ),
          Category(
            images_location: 'images/brands/vans.jpg',
            images_caption: "Vans",
          ),
          Category(
            images_location: 'images/brands/conver.jpg',
            images_caption: "Converse",
          ),
          Category(
            images_location: 'images/brands/fila.jpg',
            images_caption: "Fila",
          ),
          Category(
            images_location: 'images/brands/asics.jpg',
            images_caption: "Asics",
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget{
  final String images_location;
  final String images_caption;
  Category({this.images_location, this.images_caption});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: (){},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              images_location,
            width: 100.0,
            height: 80.0,),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(images_caption,style: new TextStyle(fontSize: 12.0),),
            ),
          ),
        ),
      ),
    );
  }
}