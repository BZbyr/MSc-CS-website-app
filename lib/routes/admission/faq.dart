import 'package:flutter/material.dart';
import 'package:flutter_app_hku/widgets/drawerWidget.dart';

class FAQ extends StatelessWidget{
  final String appTitle = 'FAQ';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: appTitle,
      home: new MyFAQPage(title: appTitle),
    );
  }
}


class MyFAQPage extends StatelessWidget{

  final String title;

  MyFAQPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(child: new Text("faq")),
      drawer: new Drawer(
        child: new DrawerWidget(),
      ),
    );
  }
}