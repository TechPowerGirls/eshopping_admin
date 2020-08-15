import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshoppingadmin/Homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DemoHomepage(),
    );
  }
}

class DemoHomepage extends StatefulWidget {
  @override
  _DemoHomepageState createState() => _DemoHomepageState();
}

class _DemoHomepageState extends State<DemoHomepage> {
  final ref = Firestore.instance.collection('demoDepartment');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: ref.snapshots(),
        builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData)
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (_, index) {
                  return ListTile(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DemoPage2(
                                    deptName: snapshot
                                        .data.documents[index].data['name'],
                                  ))),
                      title: Text(snapshot.data.documents[index].data['name']
                          .toString()));
                });
          else
            return Text('Loading');
        },
      ),
    );
  }
}

class DemoPage2 extends StatefulWidget {
  final String deptName;

  const DemoPage2({Key key, this.deptName}) : super(key: key);
  @override
  _DemoPage2State createState() => _DemoPage2State();
}

class _DemoPage2State extends State<DemoPage2> {
  getCategories() {}

  final ref = Firestore.instance.collection('demoDepartment');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: ref.where('name', isEqualTo: widget.deptName).snapshots(),
        builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic> categories =
                snapshot.data.documents[0].data['categories'];
            List keyCat = categories.keys.toList();
            print(keyCat);

            return ListView.builder(
                itemCount: keyCat.length,
                itemBuilder: (_, index) {
                  return ListTile(title: Text(keyCat[index]));
                });
          } else
            return Text('Loading');
        },
      ),
    );
  }
}
