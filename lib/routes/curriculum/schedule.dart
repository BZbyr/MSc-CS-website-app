import 'package:flutter/material.dart';
import 'package:flutter_app_hku/widgets/drawerWidget.dart';

class Schedule extends StatelessWidget{
  final String appTitle = 'Duration of Study & Class Schedule';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: appTitle,
      home: new MySchedulePage(title: appTitle),
    );
  }
}


class MySchedulePage extends StatelessWidget{

  final String title;
  final TextStyle titleStyle = const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600);

  MySchedulePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          new Column(
            children: <Widget>[
              new Text('\nDuration of Study\n',style: titleStyle,),
              new Text('The MSc(CompSc) programme is offered in both full-time and part-time modes.\n\nThere are 3 semesters in an academic year, i.e. semester 1: September – December, semester 2: January – May and the summer semester: June – August.\n\nPart-time: 2-3 years\n\nFull-time: 1-2 years\n\n'),
              new Text('Class Schedule\n\n',style: titleStyle,),
              new Text('Classes are usually conducted in weekday evenings from 7:00 p.m., or during weekends.  Some courses will be offered mainly for full-time students in weekday daytime.')
            ],
          ),
        ],
      ),
      drawer: new Drawer(
        child: new DrawerWidget(),
      ),
    );
  }
}