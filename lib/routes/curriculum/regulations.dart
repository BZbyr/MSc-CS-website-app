import 'package:flutter/material.dart';
import 'package:flutter_app_hku/widgets/drawerWidget.dart';

class Regulation extends StatelessWidget{
  final String appTitle = 'Regulations and Syllabus';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: appTitle,
      home: new MyRegulationsPage(title: appTitle),
    );
  }
}


class MyRegulationsPage extends StatelessWidget{

  final String title;
  final TextStyle titleStyle = const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600);

  MyRegulationsPage({Key key, this.title}) : super(key: key);

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
              new Text('\nREGULATIONS\n',style: titleStyle,),
              new Text('1. General Regulations of The University\n'),
              new Text('https://www4.hku.hk/pubunit/drcd/files/pgdr2017-18/genreg.pdf\n\n'),
              new Text("2. University's Regulations for Taught Postgraduate Curricula: \n"),
              new Text('https://www4.hku.hk/pubunit/drcd/files/pgdr2017-18/tpg-regulations.pdf\n\n'),
              new Text('3. Degree Regulations of MSc(CompSc)\n'),
              new Text('The regulations and syllabus are applicable to students admitted to the curriculum in 2018-2019 and thereafter.')
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