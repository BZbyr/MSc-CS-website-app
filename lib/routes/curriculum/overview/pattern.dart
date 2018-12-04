import 'package:flutter/material.dart';

class Pattern extends StatelessWidget{
  final String appTitle = 'About HKU';
  final TextStyle titleStyle = const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      children: [
        new Column(
          children: <Widget>[
            new Text('\nStudents are required to complete 72 credits of courses selected from the syllabus which must include capstone experience.\n'),
            new Text('\nEnrolment Mode\n',style: titleStyle,),
            new Text('\nStudents can study in one of the following enrolment modes:\n\n  (a)Courses (60 credits)^ + Project (12 credits)\n\n    i.e. 10 Courses + Project\n\n  OR\n\n  (b)Courses (48 credits)^ + Dissertation (24 credits)\n\n    i.e. 8 Courses + Dissertation\n\n^ Each course normally carries 6 credits'),
            new Text('\n\nSelection of Courses',style: titleStyle,),
            new Text('\n\nStudents shall select courses in accordance with the regulations of the degree. To qualify as a graduate of Cyber Security, Financial Computing, or Multimedia Computing Stream, students must pass at least 4 stream specific courses (at least 24 credits in total) in the corresponding subject group, and undertake a dissertation or a project in the area of the corresponding stream. For General Stream, students can choose any discipline courses from any subject group, and undertake a dissertation or a project in any area in computer science\n\n'),
            new Text('Students may select no more than 2 courses (at most 12 credits in total) offered by the MSc(ECom&IComp) and MSc(Eng) curricula in the Faculty of Engineering as electives.\n\n'),
            new Image.asset("res/images/pic/credit.png",fit: BoxFit.fill,),
            new Text('\n\nCapstone Experience – Dissertations and Projects\n\n',style: titleStyle,),
            new Text('The capstone experience will definitely be beneficial for students to put together what they have learnt in the programme and demonstrate a deeper understanding of the knowledge they have acquired. Students are required to complete a dissertation (24 credits) or a project (12 credits), and attend some supplementary workshops. The dissertation / project would represent students’ consolidated capstone experience in their study.')
          ],
        ),
      ],

    );
  }
}