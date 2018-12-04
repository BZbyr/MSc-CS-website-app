import 'package:flutter/material.dart';

class CompositionFees extends StatelessWidget{
  final String appTitle = 'Compostion Fees';

  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      children: [
        new Column(
          children: <Widget>[
            new Text('Composition Fees'),
            new Text(' '),
            new Text('The composition fee for each 6-credit course is HK13,000*. Project has a composition fee of HK26,000 and the Dissertation has a composition fee of HK52,000. Total composition fee for the two study modes are therefore as follows:'),
            new Text(' '),
            new Text(' 10 courses + Project:'),
            new Text(' (HK13,000 x 10) + (HK26,000) = HK156,000'),
            new Text(' '),
            new Text(' 8 Courses + Dissertation:'),
            new Text(' '),
            new Text(' (HK13,000 x 8) + (HK52,000) = HK156,000'),
            new Text(' '),
            new Text('Students who select to study a course from the MSc(ECom&IComp) and MSc(Eng) programmes have to pay HK13,000* and HK12,000* respectively per 6-credit course.'),
            new Text(' '),
            new Text('* Subject to University approval'),
            new Text(' '),
            new Text('Fees for enrolled courses are paid on semester basis.  The first instalment of composition fees of 12 credit-units is payable at the time of acceptance of an offer of admission. '),
            new Text(' '),
            new Text('Generally composition fees for cancelled enrolment before specified deadline are not refunded, but can be used to pay for another enrolled course or carried over to the next semester as credit. (Subject to the approval by the University)'),
            new Text(' '),
            new Text(' '),
            new Text('Financial Assistance'),
            new Text(' '),
            new Text('For Hong Kong Residents'),
            new Text(' '),
            new Text(' Some of our courses have been included in the list of reimbursable courses for the Hong Kong Continuing Education Fund (CEF) which provides reimbursement up to HK10,000 for eligible local students.  More details available '),
            new Text(' at: http://www.wfsfaa.gov.hk/cef/index.htm'),
            new Text(' '),
            new Text('For PRC Candidates'),
            new Text(' '),
            new Text(' PRC students who have successfully applied and been offered a place in the Master of Science in Computer Science as full-time students in Hong Kong have an opportunity to have their composition fees reduced if they apply and are awarded The China Postgraduate Scholarships for Computer Science.'),
            new Text(' '),
            new Text(' The maximum number of scholarships for 2019-20 is thirty, with a maximum value of HK30,000 each.'),
            new Text(' '),
            new Text(' The scholarships shall be used to meet part of the composition fees for a full-time programme of studies leading to the degree of Master of Science in Computer Science.'),
            new Text(' '),
            new Text(' The scholarships shall be awarded mainly on the basis of academic merits.')
          ],
        ),
      ],
    );
  }
}