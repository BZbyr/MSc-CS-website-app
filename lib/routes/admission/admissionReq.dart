import 'package:flutter/material.dart';
import 'package:flutter_app_hku/widgets/drawerWidget.dart';

class AdmissionReq extends StatelessWidget{
  final String appTitle = 'Admission Requirements';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: appTitle,
      home: new MyAdmissionReqPage(title: appTitle),
    );
  }
}


class MyAdmissionReqPage extends StatelessWidget{

  final String title;

  MyAdmissionReqPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(child: new Text("admission req")),
      drawer: new Drawer(
        child: new DrawerWidget(),
      ),
    );
  }
}