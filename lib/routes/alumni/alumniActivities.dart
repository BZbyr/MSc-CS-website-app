import 'package:flutter/material.dart';
import 'package:flutter_app_hku/widgets/drawerWidget.dart';

class AlumniActivities extends StatelessWidget{
  final String appTitle = 'Alumni Activities';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: appTitle,
      home: new MyAlumniActivitiesPage(title: appTitle),
    );
  }
}


class MyAlumniActivitiesPage extends StatelessWidget{

  final String title;

  MyAlumniActivitiesPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(child: new Text("alumni activites")),
      drawer: new Drawer(
        child: new DrawerWidget(),
      ),
    );
  }
}