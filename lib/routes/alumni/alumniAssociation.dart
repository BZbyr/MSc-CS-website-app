import 'package:flutter/material.dart';
import 'package:flutter_app_hku/widgets/drawerWidget.dart';

class AlumniAssociation extends StatelessWidget{
  final String appTitle = 'Alumni Association';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: appTitle,
      home: new MyAlumniAssociationPage(title: appTitle),
    );
  }
}


class MyAlumniAssociationPage extends StatelessWidget{

  final String title;

  MyAlumniAssociationPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(child: new Text("alumni association")),
      drawer: new Drawer(
        child: new DrawerWidget(),
      ),
    );
  }
}