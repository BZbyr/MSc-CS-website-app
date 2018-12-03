import 'package:flutter/material.dart';
import 'package:flutter_app_hku/routes/index.dart';

class DrawerWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    var curriculumExpandTile = _createExpansionTile(context, 'Curriculum', <Widget>[
      _createListTile(context, "Programme Overview", new Overview()),
      _createListTile(context, "Courses", new Courses()),
      _createListTile(context, "Duration of Study & Class Schedule", new Schedule()),
      _createListTile(context, "Regulation and Syllabus", new Regulation())
    ]);

    return new Drawer(
      child: new ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          new DrawerHeader(
            child: new Center(
              child: new Text(
                'HKU MSC',
                style: new TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
            decoration: new BoxDecoration(
              color: const Color.fromRGBO(70, 151, 236, 1.0),
            ),
          ),
          _createListTile(context, "About", new AboutPage()),
          _createListTile(context, 'Admission', new AdmissionPage()),
          curriculumExpandTile,
          _createListTile(context, "Graduate & Alumni", new AlumniPage()),
          _createListTile(context, "Evens & News", new NewsEventsPage())
        ],
      ),
    );
  }

  Widget _createListTile(BuildContext context, String title, dynamic route) {
    return new ListTile(
      title: new Text(title),
      onTap: () {
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => route),
        );
      },
    );
  }

  Widget _createExpansionTile(BuildContext context, String title, List<Widget> children) {
    return new ExpansionTile(
      title: new Text(title),
      backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
      children: children,
    );
  }
}