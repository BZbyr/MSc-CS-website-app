import 'index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_hku/widgets/tabWidget.dart';

class NewsEventsPage extends StatefulWidget{

  @override
  _NewsEventsPageState createState() => new _NewsEventsPageState();
}

class _NewsEventsPageState extends State<NewsEventsPage>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final List<String> tabs = <String>['News', 'Events'];

    final List<Widget> widgets = <Widget>[
      new News(),
      new Events()
    ];

    return new TabbedScaffold(
      title: 'News & Events',
      tabs: tabs,
      widgets: widgets,
    );
  }
}