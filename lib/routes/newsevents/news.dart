import 'package:flutter/material.dart';
import 'package:flutter_app_hku/widgets/drawerWidget.dart';

class News extends StatelessWidget{
  final String appTitle = 'News';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: appTitle,
      home: new MyNewsPage(title: appTitle),
    );
  }
}


class MyNewsPage extends StatelessWidget{

  final String title;

  MyNewsPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(child: new Text("news")),
      drawer: new Drawer(
        child: new DrawerWidget(),
      ),
    );
  }
}