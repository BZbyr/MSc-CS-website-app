import 'package:flutter/material.dart';

class Faculty extends StatelessWidget{
  final String appTitle = 'Faculty';

  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      children: [
        new Column(
          children: <Widget>[
            new Text('The Department of Computer Science is committed to high-quality education and training of computing professionals at both the undergraduate and postgraduate levels. At the postgraduate level, we offer two taught programmes based on coursework, the MSc(CompSc) and the MSc(ECom&IComp), as well as the research-based MPhil and PhD programmes.'),
            new Text(' '),
            new Text('The academic staff is active in research and development in a variety of areas including databases, parallel and distributed computing, computer networks, computer graphics, algorithms and complexity, computer vision, multimedia, software engineering, statistical computing, information security and computer forensics, and legal aspects of computing. Some of our research results have been applied to the development of real software and systems. You will have these researchers as your inspiring teachers of the courses in this programme. Here are some of them.')
          ],
        ),
      ],
    );
  }
}