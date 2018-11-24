import 'package:flutter/material.dart';
import 'package:flutter_app_hku/widgets/drawerWidget.dart';

class InfoSession extends StatelessWidget{
  final String appTitle = 'Infomation Session';

  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      children: [
        new Column(
          children: <Widget>[
            new Text('Join us at the information sessions, and find out if the Master of Science in Computer Science Programme is the right fit for your career goals. Information Sessions include a programme overview and Q&A, plus the opportunity to talk informally with Programme Director and staff. Potential applicants are welcome.'),
            new Text(' '),
            new Text('Information sessions will be organized in Hong Kong and Mainland China. Details of these information sessions will be announced on our website and/or advertised online and in major local newspapers.')
          ],
        ),
      ],
    );
  }
}