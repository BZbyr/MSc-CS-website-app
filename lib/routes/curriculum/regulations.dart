import 'package:flutter/material.dart';
import 'package:flutter_app_hku/widgets/drawerWidget.dart';

class Regulation extends StatelessWidget{
  final String appTitle = 'Regulations and Syllabus';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: appTitle,
      home: new MyRegulationsPage(title: appTitle),
    );
  }
}


class MyRegulationsPage extends StatelessWidget{

  final String title;

  MyRegulationsPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(child: new Text("regulation")),
      drawer: new Drawer(
        child: new DrawerWidget(),
      ),
    );
  }
}