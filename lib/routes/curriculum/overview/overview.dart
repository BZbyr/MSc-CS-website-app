import 'programOverview.dart';
import 'pattern.dart';
import 'stream.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_hku/widgets/tabWidget.dart';

class Overview extends StatefulWidget{

  @override
  _OverviewState createState() => new _OverviewState();
}

class _OverviewState extends State<Overview>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final List<String> tabs = <String>['Overview', 'Stream of Study', 'Pattern of Study'];

    final List<Widget> widgets = <Widget>[
      new ProgramOverview(),
      new Stream(),
      new Pattern(),
    ];

    return new TabbedScaffold(
      title: 'Program Overview',
      tabs: tabs,
      widgets: widgets,
      isScrollable: true,
    );
  }
}