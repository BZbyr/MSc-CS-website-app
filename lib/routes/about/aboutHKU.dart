import 'package:flutter/material.dart';
import 'package:flutter_app_hku/widgets/drawerWidget.dart';

class AboutHKU extends StatelessWidget{
  final String appTitle = 'About HKU';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: appTitle,
      home: new MyAboutHKU(title: appTitle),
    );
  }
}

class MyAboutHKU extends StatelessWidget{

  final String title;

  MyAboutHKU({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(child: new Text("about hku")),
      drawer: new Drawer(
        child: new DrawerWidget(),
      ),
    );
  }
}