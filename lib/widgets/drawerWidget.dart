import 'package:flutter/material.dart';
import 'about/aboutHKU.dart';
import 'about/faculty.dart';
import 'about/messageDirector.dart';
import 'admission/admissionReq.dart';
import 'admission/applicationProducures.dart';
import 'admission/compositionFees.dart';
import 'admission/faq.dart';
import 'admission/infoSession.dart';
import 'admission/works.dart';
import 'alumni/alumniActivites.dart';
import 'alumni/alumniAssociation.dart';
import 'news&events/events.dart';
import 'news&events/news.dart';
import 'curriculum/courses.dart';
import 'curriculum/overview.dart';
import 'curriculum/regulations.dart';
import 'curriculum/schedule.dart';

class DrawerWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    var aboutExpandTile = _createExpansionTile(context, 'About', <Widget>[
      _createListTile(context, "Faculty", new Faculty()),
      _createListTile(context, "Message from Programme Director", new MessageDirector()),
      _createListTile(context, "About HKU", new AboutHKU())
      
    ]);

    var admissionExpandTile = _createExpansionTile(context, 'Admission', <Widget>[
      _createListTile(context, "Admission Requirements", new AdmissionReq()),
      _createListTile(context, "Application Producures", new ApplicationProducures()),
      _createListTile(context, "Composition Fees", new CompositionFees()),
      _createListTile(context, "Works for Students and Graduates", new Works()),
      _createListTile(context, "Info Session", new InfoSession()),
      _createListTile(context, "FAQ", new FAQ())
    ]);

    var curriculumExpandTile = null;

    var alumniExpandTile = null;

    var neweventExpandTile = null;

    // TODO: implement drawer list
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
              color: const Color.fromRGBO(255, 149, 3, 1.0),
            ),
          ),
          aboutExpandTile,
          admissionExpandTile,
          curriculumExpandTile,
          alumniExpandTile,
          neweventExpandTile
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