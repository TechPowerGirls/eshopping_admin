import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class SubCategory extends StatefulWidget {
  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  TextEditingController cat_nameController = TextEditingController();
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
    CollectionReference collectionReference = Firestore.instance.collection("subcategories");
    addProduct(){
      productToAdd={
        "cat_name":cat_nameController.text,
        "subcat_name":nameController.text,
        "subcat_id":idController.text,


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
                  _buildTextField(cat_nameController, 'cat_name'),
                  SizedBox(height: 10,),
                  _buildTextField(nameController, 'subcat_name'),
                  SizedBox(height: 10,),
                  _buildTextField(idController, 'subcat_id'),
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
