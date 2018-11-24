import 'index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_hku/widgets/tabWidget.dart';

class AdmissionPage extends StatefulWidget{

  @override
  _AdmissionState createState() => new _AdmissionState();
}

class _AdmissionState extends State<AdmissionPage>{

  @override
  Widget build(BuildContext context) {
    
    final List<String> tabs = <String>['Admission Requirements', 'Application Procedures','Composition Fees','Works from Students and Gradutes', 'Information Session', 'FAQ'];

    final List<Widget> widgets = <Widget>[
      new AdmissionReq(),
      new ApplicationProcedures(),
      new CompositionFees(),
      new Works(),
      new InfoSession(),
      new FAQ()
    ];

    return new TabbedScaffold(
      title: 'Admission',
      tabs: tabs,
      widgets: widgets,
      isScrollable: true,
    );
  }
}