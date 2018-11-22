import 'package:flutter/material.dart';
import 'package:flutter_app_hku/widgets/drawerWidget.dart';

class Overview extends StatelessWidget{
  final String appTitle = 'Programme Overview';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: appTitle,
      home: new MyOverviewPage(title: appTitle),
    );
  }
}


class MyOverviewPage extends StatelessWidget{

  final String title;

  MyOverviewPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(child: new Text("overview")),
      drawer: new Drawer(
        child: new DrawerWidget(),
      ),
    );
  }
}