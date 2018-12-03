import 'package:flutter/material.dart';
import 'package:flutter_app_hku/widgets/drawerWidget.dart';

class Courses extends StatelessWidget{
  final String appTitle = 'Courses';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: appTitle,
      home: new MyCoursesPage(title: appTitle),
    );
  }
}


class MyCoursesPage extends StatelessWidget{

  final String title;
  final TextStyle titleStyle = const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600);

  MyCoursesPage({Key key, this.title}) : super(key: key);

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
              new Text('\nMSc(CompSc) Courses\n',style: titleStyle,),
              new Text('The following is a list of courses offered for the MSc(CompSc) curriculum by the Department of Computer Science.  The courses, both in terms of range and syllabus, are updated and revised continuously by the Programme Committee and the Department.  Any revision requires University’s approval.  The list of courses is also subject to change because occasionally we may decide not to offer a particular course in one year or to add some new ones, based on the findings of the annual curriculum review.  Please refer to our website for updated information.\n\n'),
              new Image.asset("res/images/pic/Courses.png",fit: BoxFit.fill,),
              new Text("\n^ Students with focussed streams of study have to take at least 24 credits courses (equivalent to four 6-credit courses) in the corresponding subject group.\n\n# Subject to University's approval\n\n"),
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