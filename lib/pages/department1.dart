import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Department extends StatefulWidget {
  @override
  _DepartmentState createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {
  @override
  Widget build(BuildContext context) {
    final Ref = Firestore.instance.collection("products");
    getSubcategory(){
      var result = Ref
      .where('cat_name',isEqualTo: 'bags')
      .where('subcat_name',isEqualTo: 'tot bag');
      result.snapshots().listen((event) {print(event.documents[0].data.toString()); });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("add Department"),
      ),
      body: StreamBuilder(
        stream: Ref.snapshots(),
        builder: (_,snapshots){
          return Text(snapshots.data.documents[0].data.toString());
        },
      ),
    );
  }
}
