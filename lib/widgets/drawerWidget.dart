import 'package:flutter/material.dart';
import 'package:flutter_app_hku/routes/about/aboutHKU.dart';
import 'package:flutter_app_hku/routes/index.dart';

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
      _createListTile(context, "Application Producures", new ApplicationProcedures()),
      _createListTile(context, "Composition Fees", new CompositionFees()),
      _createListTile(context, "Works for Students and Graduates", new Works()),
      _createListTile(context, "Info Session", new InfoSession()),
      _createListTile(context, "FAQ", new FAQ())
    ]);

    var curriculumExpandTile = _createExpansionTile(context, 'Curriculum', <Widget>[
      _createListTile(context, "Programme Overview", new Overview()),
      _createListTile(context, "Courses", new Courses()),
      _createListTile(context, "Duration of Study & Class Schedule", new Schedule()),
      _createListTile(context, "Regulation and Syllabus", new Regulation())
    ]);

    var alumniExpandTile = _createExpansionTile(context, "Graduate & Alumni", <Widget>[
      _createListTile(context, "Alumni Association", new AlumniAssociation()),
      _createListTile(context, "Alumni Activites", new AlumniActivities())
    ]);

    var newExpandTile = _createExpansionTile(context, "News & Events", <Widget>[
      _createListTile(context, "News", new News()),
      _createListTile(context, "Events", new Events())
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
          aboutExpandTile,
          admissionExpandTile,
          curriculumExpandTile,
          alumniExpandTile,
          newExpandTile
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