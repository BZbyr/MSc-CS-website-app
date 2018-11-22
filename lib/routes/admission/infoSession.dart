import 'package:flutter/material.dart';
import 'package:flutter_app_hku/widgets/drawerWidget.dart';

class InfoSession extends StatelessWidget{
  final String appTitle = 'Infomation Session';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: appTitle,
      home: new MyInfoSessionPage(title: appTitle),
    );
  }
}


class MyInfoSessionPage extends StatelessWidget{

  final String title;

  MyInfoSessionPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(child: new Text("information session")),
      drawer: new Drawer(
        child: new DrawerWidget(),
      ),
    );
  }
}