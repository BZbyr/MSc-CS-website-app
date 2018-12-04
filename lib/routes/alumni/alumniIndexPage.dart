import 'index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_hku/widgets/tabWidget.dart';

class AlumniPage extends StatefulWidget{

  @override
  _AlumniPageState createState() => new _AlumniPageState();
}

class _AlumniPageState extends State<AlumniPage>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final List<String> tabs = <String>['Alumni Association', 'Alumni Activites'];

    final List<Widget> widgets = <Widget>[
      new AlumniAssociation(),
      new AlumniActivities()
    ];

    return new TabbedScaffold(
      title: 'Graduate & Alumni',
      tabs: tabs,
      widgets: widgets,
      isScrollable: false,
    );
  }
}