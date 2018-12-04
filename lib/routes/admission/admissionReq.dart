import 'package:flutter/material.dart';

class AdmissionReq extends StatelessWidget{
  final String appTitle = 'Admission Requirements';

  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      children: [
        new Column(
          children: <Widget>[
            new Text('Admission Requirements'),
            new Text(' '),
            new Text('Eligibility'),
            new Text(' '),
            new Text('To be eligible for admission to the programmes, a candidate shall satisfy both the University Entrance Requirements and the Programme Entrance Requirements including but not limited to:'),
            new Text(' '),
            new Text('  a. shall comply with the General Regulations;'),
            new Text('  b. shall hold a Bachelor’s degree of this University or a qualification of equivalent standard from this University or another comparable institution accepted for this purpose;'),
            new Text('  c. for a candidate who is seeking admission on the basis of a qualification from a university or comparable institution outside Hong Kong of which the language of teaching and/or examination is not English, shall satisfy the University English language requirement applicable to high degrees as prescribed under General Regulation G2(b); and'),
            new Text('  d. satisfy the examiners in a qualifying examination if required.'),
            new Text(' '),
            new Text('Regulations:'),
            new Text(' '),
            new Text('  1. General Regulations of The University: https://www4.hku.hk/pubunit/drcd/files/pgdr2017-18/genreg.pdf'),
            new Text(' '),
            new Text('  2. Universitys Regulations for Taught Postgraduate Curricula: https://www4.hku.hk/pubunit/drcd/files/pgdr2017-18/tpg-regulations.pdf'),
            new Text(' '),
            new Text('  3. Degree Regulations of MSc(CompSc) for students admitted to the curriculum in 2017-2018 and thereafter: http://www.msc-cs.hku.hk/Media/Default/RegulationSyllabus/Regulations_MSc_2017-18.pdf, http://www.msc-cs.hku.hk/Media/Default/RegulationSyllabus/Syllabus_MSc(CompSc)_2018-19.pdf'),
            new Text(' '),
            new Text('English Language Proficiency Requirement'),
            new Text(' '),
            new Text('Applicants who wish to be admitted on the basis of a qualification from a university or comparable institution outside Hong Kong where the language of teaching and/or examination is not English are required to obtain:'),
            new Text(' '),
            new Text(' a. a score of 550 or above (paper-based test) or 80 or above (internet-based test) in the Test of English as a Foreign Language (TOEFL).  Applicants who took the TOEFL should request the Educational Testing Service (ETS) to send an official score report to the University directly. For this purpose, the HKU TOEFL code is 9671. Test scores more than two years old will not be accepted; or'),
            new Text(' '),
            new Text(' b. a minimum overall band of 6 with no subtest lower than 5.5 in the International English Language Testing System (IELTS); or'),
            new Text(' '),
            new Text(' c. grade C or above in the Overseas General Certificate of Education (GCE); or'),
            new Text(' '),
            new Text(' d. grade C or above in the International General Certificate of Secondary Education (IGCSE); or'),
            new Text(' '),
            new Text(' e. grade C or above in the Cambridge Test of Proficiency in English Language;'),
            new Text(' '),
            new Text('unless in exceptional circumstances they are exempted from this requirement.')
          ],
        ),
      ],
    );
  }
}