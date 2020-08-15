import 'package:eshoppingadmin/pages/category.dart';
import 'package:eshoppingadmin/pages/department.dart';
import 'package:eshoppingadmin/pages/product.dart';
import 'package:eshoppingadmin/pages/subcategory.dart';
import 'package:eshoppingadmin/pages/user.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final collectionReference = Firestore.instance.collection("Demo");
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30,),
              FlatButton(
                onPressed: ()=>Navigator.push(context, MaterialPageRoute(
                  builder: (_)=>User(),
                )),
                child: Container(
                    height: 60,
                    width: 200,
                    color: Colors.deepOrangeAccent,
                    child: Center(child: Text("User"))),
              ),
              SizedBox(height: 10,),
              FlatButton(
                onPressed: ()=>Navigator.push(context, MaterialPageRoute(
                  builder: (_)=>Department(),
                )),
                child: Container(
                    height: 60,
                    width: 200,
                    color: Colors.deepOrangeAccent,
                    child: Center(child: Text("department"))),
              ),
              SizedBox(height: 10,),
              FlatButton(
                onPressed: ()=>Navigator.push(context, MaterialPageRoute(
                  builder: (_)=>Category(),
                )),
                child: Container(
                    height: 60,
                    width: 200,
                    color: Colors.deepOrangeAccent,
                    child: Center(child: Text("category"))),
              ),
              SizedBox(height: 10,),
              FlatButton(
                onPressed: ()=>Navigator.push(context, MaterialPageRoute(
                  builder: (_)=>SubCategory(),
                )),
                child: Container(
                    height: 60,
                    width: 200,
                    color: Colors.deepOrangeAccent,
                    child: Center(child: Text("Subcategory"))),
              ),
              SizedBox(height: 10,),
              FlatButton(
                onPressed: ()=>Navigator.push(context, MaterialPageRoute(
                  builder: (_)=>Products(),
                )),
                child: Container(
                    height: 60,
                    width: 200,
                    color: Colors.deepOrangeAccent,
                    child: Center(child: Text("Product"))),
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
      //Center(

    );
  }
}
