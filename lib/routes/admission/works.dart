import 'package:flutter/material.dart';
import 'package:flutter_app_hku/widgets/drawerWidget.dart';

class Works extends StatelessWidget{
  final String appTitle = 'Words from Students and Graduates';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: appTitle,
      home: new MyWorksPage(title: appTitle),
    );
  }
}


class MyWorksPage extends StatelessWidget{

  final String title;

  MyWorksPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(child: new Text("work")),
      drawer: new Drawer(
        child: new DrawerWidget(),
      ),
    );
  }
}