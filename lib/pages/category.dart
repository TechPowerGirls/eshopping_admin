import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  TextEditingController dep_nameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _buildTextField(
        TextEditingController controller, String labelText) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.pink, border: Border.all(color: Colors.red)),
        child: TextField(
          controller: controller,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              labelText: labelText,
              labelStyle: TextStyle(color: Colors.white),

              // prefix: Icon(icon),
              border: InputBorder.none),
        ),
      );
    }
    Map<String,dynamic> productToAdd;
    CollectionReference collectionReference = Firestore.instance.collection("categories");
    addProduct(){
      productToAdd={
        "dep_name":dep_nameController.text,
        "cat_name":nameController.text,
        "cat_id":idController.text,


      };
      collectionReference.add(productToAdd).whenComplete(() => print("added to the database"));
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("add Department"),
        ),
        body:Scaffold(
          backgroundColor: Colors.red,
          appBar: AppBar(
            title: Text("Category page"),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.folder_open),
                onPressed: () {

                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10,),
                  _buildTextField(dep_nameController, 'dep_name'),
                  SizedBox(height: 10,),
                  _buildTextField(nameController, 'cat_name'),
                  SizedBox(height: 10,),
                  _buildTextField(idController, 'cat_id'),
                  SizedBox(height: 10,),

                  SizedBox(height: 10,),
                  FlatButton(
                    onPressed: (){
                      addProduct();

                    },
                    child: Container(
                      height: 60,
                      width: 300,
                      color: Colors.pink,
                      child: Center(child: Text("Add department ",style: TextStyle(
                        color: Colors.white,
                      ),)),
                    ),
                  )

                ],
              ),
            ),
          ),
        )
    );
  }
}
