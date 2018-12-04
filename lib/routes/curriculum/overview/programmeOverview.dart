import 'package:flutter/material.dart';

class ProgrammeOverview extends StatelessWidget{
  final String appTitle = 'About HKU';

  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      children: [
        new Column(
          children: <Widget>[
            new Text('\nThe MSc(CompSc) programme is a comprehensive postgraduate study programme provides advanced and in-depth learning in Computer Science.  The programme is credit unit based, with courses of both applied and fundamental nature.\n'),
            new Text('\nStudents can choose focussed streams of study or a comprehensive and diversified study in Computer Science, i.e. the General Stream.\n'),
            new Text('\nFocussed streams of study represent a cohesive collection of related courses that provides both fundamental and in-depth exposure to students in a given ICT domain.  Students can extend and deepen their knowledge in the specialization streams in Cyber Security, Multimedia Computing and Financial Computing. \n')
          ],
        ),
      ],

    );
  }
}