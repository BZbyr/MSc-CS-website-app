import 'package:flutter/material.dart';

class ApplicationProcedures extends StatelessWidget{
  final String appTitle = 'Application Procedures';

  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      children: [
        new Column(
          children: <Widget>[
            new Text('Application Procedures'),
            new Text(' '),
            new Text('Applicants can submit their application via the online application system by clicking the following button.'),
            new Text(' '),
            new Text('The following supporting documents should be uploaded to the online application system before the application deadline or expiry of your application account (which is valid for four weeks only), whichever is earlier:'),
            new Text(' '),
            new Text(' • Graduate transcript(s) with grading system of all tertiary level studies'),
            new Text(' • Degree certificate(s)'),
            new Text(' • English Language proficiency test score report, such as TOEFL or IELTS (only for applicants with qualifications from institutions outside Hong Kong where the language of instruction and/or examination is not English)'),
            new Text(' • Proof of Cumulative Grade Point Average (CGPA) / average grade / average mark'),
            new Text(' • Official proof of class ranking, if available'),
            new Text(' • A curriculum vitae (C.V.)'),
            new Text(' '),
            new Text('Applicants are not required to submit original documents during the application stage.  Should an applicant be given an admission offer by the Programme, he/she will receive notification of the need to submit original/certified true copy* of the documents to the MSc(CompSc) Programme Office.'),
            new Text(' '),
            new Text('Please note that documents once submitted will not be returned, and will be destroyed if the application is unsuccessful.'),
            new Text(' '),
            new Text('*The University will only ACCEPT originals and copies of the documents that have been duly declared as true copies before a notary public.'),
            new Text(' '),
            new Text(' '),
            new Text('Application Fee'),
            new Text(' '),
            new Text('The application fee is HK300 (non-refundable), paid by credit card online.'),
            new Text(' '),
            new Text('Application Timetable'),
            new Text(' '),
            new Text('To be considered for a round, you must submit a complete application, including all online / mail-in materials by the day of the deadline.'),
            new Text(' '),
            new Text('The results for admission in September are normally available by July of the same year. Hence, applicants who do not hear from the Faculty of Engineering by July 31, 2019 may assume the application to be unsuccessful.')
          ],
        ),
      ],
    );
  }
}