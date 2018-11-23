import 'package:flutter/material.dart';

class Events extends StatelessWidget{
  final String appTitle = 'Events';

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: new Column(
        children: <Widget>[
          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: <Widget>[
                    new Image.asset(
                        'res/images/material_design_4.jpg',
                        height: 192,
                        fit: BoxFit.fill,
                    ),
                    new ListTile(
                      title: new Text(
                        'Events 1',
                        style:
                        new TextStyle(color: Colors.white, fontSize: 24.0),
                      ),
                    ),
                  ],
                ),
                new ButtonTheme.bar(
                  child: new ButtonBar(
                    alignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new IconButton(
                        icon: new Icon(Icons.share, color: Colors.grey),
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ].map((Widget widget){
          // add a little space between the widgets
          return new Container(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: widget,
          );
        }).toList(),
      ),
    );
  }
}
