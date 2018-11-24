import 'index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_hku/widgets/tabWidget.dart';

class AboutPage extends StatefulWidget{

  @override
  _AboutPageState createState() => new _AboutPageState();
}

class _AboutPageState extends State<AboutPage>{

  @override
  Widget build(BuildContext context) {
    
    final List<String> tabs = <String>['About HKU', 'Message from Programme Director','Faculty'];

    final List<Widget> widgets = <Widget>[
      new AboutHKU(),
      new MessageDirector(),
      new Faculty()
    ];

    return new TabbedScaffold(
      title: 'About',
      tabs: tabs,
      widgets: widgets,
      isScrollable: true,
    );
  }
}