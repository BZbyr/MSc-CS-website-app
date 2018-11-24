import 'package:flutter/material.dart';
import 'package:flutter_app_hku/widgets/drawerWidget.dart';

class Works extends StatelessWidget{
  final String appTitle = 'Words from Students and Graduates';

  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      children: [
        new Column(
          children: <Widget>[
            new Text('When you enrol in the MSc(CompSc) Programme, you gain all the advantages of a famous university with an outstanding reputation. When you leave our Programme, you will have a solid foundation in the theoretical aspect of computer science, together with hands-on technical experience in information technology, to help you begin a rewarding career.'),
            new Text(' '),
            new Text('But a master’s programme does not have to be the last chapter of your learning merely technical, hard-core information technology; it can serve as a springboard to other career opportunities and learning challenges. For example, many of our graduates who find themselves moving into management, may continue their studies towards an MBA degree, while others may go on to doctoral studies here at HKU or elsewhere.'),
            new Text(' '),
            new Text('Some of our students and graduates would also like to share their experience with you.')
          ],
        ),
      ],
    );
  }
}
