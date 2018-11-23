import 'package:flutter/material.dart';
import 'package:flutter_app_hku/widgets/drawerWidget.dart';

class News extends StatelessWidget {
  final String appTitle = 'News';

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
                      'res/images/pic/material_design_4.jpg',
                      height: 192,
                      fit: BoxFit.fill,
                    ),
                    new ListTile(
                      title: new Text(
                        'News 1',
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
