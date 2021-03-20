import 'package:flutter/material.dart';

class Product_Detail extends StatefulWidget {

  final product_detail_name ;
  final product_detail_new_price ;
  final product_detail_old_price ;
  final product_detail_picture ;
  Product_Detail({
    this.product_detail_name,
    this.product_detail_new_price,
    this.product_detail_old_price,
    this.product_detail_picture
});
  @override
  _Product_DetailState createState() => _Product_DetailState();
}

class _Product_DetailState extends State<Product_Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: new AppBar(
            elevation: 0,
            backgroundColor: Colors.red,
            centerTitle: true,
            title: Text("Detail"),
            actions: <Widget>[
              new IconButton(icon: Icon(Icons.search,color: Colors.white,), onPressed: (){}),
            ],
          ),
      body: new ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color : Colors.white70,
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(widget.product_detail_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                          child: Text('\$ ${widget.product_detail_old_price}',
                            style:TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough,) ,),
                      ),
                      Expanded(
                        child: Text('\$ ${widget.product_detail_new_price}',
                          style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          // ======================= Body ======================
          Row(
            children: <Widget>[

              //===============Size button===================
              Expanded(
                  child: MaterialButton(
                    onPressed: (){
                    showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text("Size"),
                        content: new Text("Choose the size"),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                             child:new Text("Close") ,
                          ),
                        ],
                      );
                    });},
                    color: Colors.white,
                    textColor: Colors.grey,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: new Text("SIZE"),
                        ),
                        Expanded(
                          child: new Icon(Icons.arrow_drop_down),
                        )
                      ],
                    ),
                  )),
      // =============Colors
              Expanded(
                  child: MaterialButton(onPressed: (){
                    showDialog(context: context,
                        builder: (context){
                          return new AlertDialog(
                            title: new Text("Colors"),
                            content: new Text("Choose the colors"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: (){
                                Navigator.of(context).pop(context);
                              },
                                child:new Text("Close") ,
                              ),
                            ],
                          );
                        });},
                    color: Colors.white,
                    textColor: Colors.grey,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: new Text("Colors"),
                        ),
                        Expanded(
                          child: new Icon(Icons.arrow_drop_down),
                        )
                      ],
                    ),
                  )),
              //=============quality ===================
              Expanded(
                  child: MaterialButton(onPressed: (){
                    showDialog(context: context,
                        builder: (context){
                          return new AlertDialog(
                            title: new Text("Quality"),
                            content: new Text("Choose the Quality"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: (){
                                Navigator.of(context).pop(context);
                              },
                                child:new Text("Close") ,
                              ),
                            ],
                          );
                        });},
                    color: Colors.white,
                    textColor: Colors.grey,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: new Text("Qty"),
                        ),
                        Expanded(
                          child: new Icon(Icons.arrow_drop_down),
                        )
                      ],
                    ),
                  )),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: MaterialButton(
                      onPressed: (){},
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: Text("By Now"),
                  )
              ),
              new IconButton(icon: Icon(Icons.add_shopping_cart,color: Colors.red,), onPressed: (){}),
              new IconButton(icon: Icon(Icons.favorite,color: Colors.red,), onPressed: (){})
            ],
          ),
          Divider(color: Colors.black,),
          new ListTile(
            title: new Text("Products Detail"),
            subtitle: new Text("PEACEMINUSONE x Nike Air Force 1 "
                "Para-noise" " Hàn Quốc giới hạn G-Dragon Kwon Ji Long băng đảng thấp"
               " Phiên bản giày thể thao tiết kiệm chi phí nhất"
               "\ #Original đúng lớp đầu tiên xước âm nhạc điều trị lớp phủ bên trong da ma cà rồng ẩn vết xước bất ngờ âm nhạc hiệu ứng graffiti"
               "Đệm đế đệm khí toàn lòng bàn tay tích hợp"
                "Số bài báo chính thức: DD3223-100LFZ"
                "Kích thước: 36 36,5 37,5 38 38,5 39 40 40,5 41 42 42,5 43 44 44,5 45"),
          ),
          Divider(),

          //=============Tên Sản phẩm================
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Products Name ", style: TextStyle(
                  color: Colors.black
                ),),
              ),
              //==== bên cạnh add trong database
              Padding(
                  padding:EdgeInsets.all(5.0),
                  child:new Text(widget.product_detail_name,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),) ,
              ),
            ],
          ),

          //=============Nhẫn Hiệu Sản phẩm================
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Products Brands ", style: TextStyle(
                    color: Colors.black
                ),),
              ),
              Padding(
                padding:EdgeInsets.all(5.0),
                child:new Text("Brands",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)) ,
              ),
            ],
          ),

          //=============Độ mới hiệu Sản phẩm= add thêm vào thuộc tính của Product===============
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Products condition ", style: TextStyle(
                    color: Colors.black
                ),),
              ),
              Padding(
                padding:EdgeInsets.all(5.0),
                child:new Text("Conditions - New",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),) ,
              ),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text("Similar products",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.lightGreen),),
          ),
          // Sản phaarrm tương tự cùng categories=========
          Container(
            height: 360.0,
            child:Similar_product(),
          )
        ],
      ),
    );
  }
}
//==========sản phẩm tương tự =========== sét theo thể loại (category)
class Similar_product extends StatefulWidget {
  @override
  _Similar_productState createState() => _Similar_productState();
}

class _Similar_productState extends State<Similar_product> {
  var product_list = [
    {
      "name":"Balenciaga track 2 ",
      "picture":"images/products/3.jpg",
      "old_price":120,
      "price":85,
    },
    {
      "name":"Balenciaga track 3 ",
      "picture":"images/products/4.jpg",
      "old_price":150,
      "price":100,
    },
    {
      "name":"Balenciaga track 4 ",
      "picture":"images/products/5.jpg",
      "old_price":230,
      "price":185,
    },
    {
      "name":"Balenciaga track 5 ",
      "picture":"images/products/8.jpg",
      "old_price":230,
      "price":185,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context,int index){
        return Similar_Single_pro(
          product_name: product_list[index]['name'],
          product_images: product_list[index]['picture'],
          product_old_price: product_list[index]['old_price'],
          product_price: product_list[index]['price'],
        );
      },
    );
  }
}

class Similar_Single_pro extends StatelessWidget {
  final product_name;
  final product_images;
  final product_old_price;
  final product_price;

  Similar_Single_pro({
    this.product_name,
    this.product_images,
    this.product_old_price,
    this.product_price
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Hero(
        tag: product_name,
        child: Material(
          child: InkWell(
            onTap: () =>
                Navigator.of(context).push(
                    new MaterialPageRoute(
                        builder: (context) =>
                        new Product_Detail(
                          product_detail_name: product_name,
                          product_detail_new_price: product_price,
                          product_detail_old_price: product_old_price,
                          product_detail_picture: product_images,
                        ))),
            child: GridTile(
                footer: Container(
                    color: Colors.white54,
                    child: new Row(
                      children: <Widget>[
                        Expanded(
                          child: new Text(product_name,
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 20.0),),
                        ),
                        Text("\$ ${product_price}", style: TextStyle(
                            color: Colors.red,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),)
                      ],
                    )
                ),
                child: Image.asset(
                  product_images,
                  fit: BoxFit.cover,)
            ),
          ),
        ),
      ),
    );
  }
}
