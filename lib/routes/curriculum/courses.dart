import 'package:flutter/material.dart';
import 'package:flutter_app_hku/widgets/drawerWidget.dart';

class Courses extends StatelessWidget{
  final String appTitle = 'Courses';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: appTitle,
      home: new MyCoursesPage(title: appTitle),
    );
  }
}


class MyCoursesPage extends StatelessWidget{

  final String title;

  MyCoursesPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(child: new Text("courses")),
      drawer: new Drawer(
        child: new DrawerWidget(),
      ),
    );
  }
}