import 'package:flutter/material.dart';
import 'package:flutter_app_hku/widgets/drawerWidget.dart';

class ApplicationProcedures extends StatelessWidget{
  final String appTitle = 'Application Procedures';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: appTitle,
      home: new MyApplicationProceduresPage(title: appTitle),
    );
  }
}


class MyApplicationProceduresPage extends StatelessWidget{

  final String title;

  MyApplicationProceduresPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(child: new Text("application producures")),
      drawer: new Drawer(
        child: new DrawerWidget(),
      ),
    );
  }
}