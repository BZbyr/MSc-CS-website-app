import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Events extends StatelessWidget{
  final String appTitle = 'Words from Students and Graduates';
  const Events({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) => new EventsHome();

}

const double _kFabHalfSize = 28.0; // TODO: needs to adapt to screen size
const double _kRecipePageMaxWidth = 500.0;

final ThemeData _kTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  accentColor: Colors.amber,
);

class EventsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const EventsGridPage(news: kEventRecipes);
  }
}

class EventStyle extends TextStyle {
  const EventStyle({
    double fontSize: 12.0,
    FontWeight fontWeight,
    Color color: Colors.black87,
    double letterSpacing,
    double height,
  }) : super(
    inherit: false,
    color: color,
    fontFamily: 'Raleway',
    fontSize: fontSize,
    fontWeight: fontWeight,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: letterSpacing,
    height: height,
  );
}

// Displays a grid of recipe cards.
class EventsGridPage extends StatefulWidget {
  const EventsGridPage({ Key key, this.news }) : super(key: key);

  final List<Event> news;

  @override
  _EventsGridPageState createState() => new _EventsGridPageState();
}

class _EventsGridPageState extends State<EventsGridPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return new Theme(
        data: _kTheme.copyWith(platform: Theme.of(context).platform),
        child: new Scaffold(
          key: scaffoldKey,
          body: new CustomScrollView(
            slivers: <Widget>[
              _buildBody(context, statusBarHeight),
            ],
          ),

        )
    );
  }

  Widget _buildBody(BuildContext context, double statusBarHeight) {
    final EdgeInsets mediaPadding = MediaQuery.of(context).padding;
    final EdgeInsets padding = new EdgeInsets.only(
        top: 8.0,
        left: 8.0 + mediaPadding.left,
        right: 8.0 + mediaPadding.right,
        bottom: 8.0
    );
    return new SliverPadding(
      padding: padding,
      sliver:
      new SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: _kRecipePageMaxWidth,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            final Event recipe = widget.news[index];
            return new EventCard(
              aNew: recipe,
              onTap: () { showRecipePage(context, recipe); },
            );
          },
          childCount: widget.news.length,
        ),
      ),
    );
  }

  void showRecipePage(BuildContext context, Event recipe) {
    Navigator.push(context, new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return new Theme(
          data: _kTheme.copyWith(platform: Theme.of(context).platform),
          child: new EventPage(recipe: recipe),
        );
      },
    ));
  }
}


// A card with the recipe's image, author, and title.
class EventCard extends StatelessWidget {
  final TextStyle titleStyle = const EventStyle(fontSize: 24.0, fontWeight: FontWeight.w600);
  final TextStyle authorStyle = const EventStyle(fontWeight: FontWeight.w500, color: Colors.black54);

  const EventCard({ Key key, this.aNew, this.onTap }) : super(key: key);

  final Event aNew;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: onTap,
      child: new Card(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Hero(
              tag: aNew.imagePath,
              child: new Image.asset(
                aNew.imagePath,
                fit: BoxFit.contain,
              ),
            ),
            new Expanded(
              child: new Row(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Image.asset(
                      aNew.ingredientsImagePath,
                      width: 48.0,
                      height: 48.0,
                    ),
                  ),
                  new Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(aNew.name, style: titleStyle, softWrap: false, overflow: TextOverflow.fade,),
                        new Text(aNew.author, style: authorStyle),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Displays one recipe. Includes the recipe sheet with a background image.
class EventPage extends StatefulWidget {
  const EventPage({ Key key, this.recipe }) : super(key: key);

  final Event recipe;

  @override
  _EventPageState createState() => new _EventPageState();
}

//每个card主页面渲染
class _EventPageState extends State<EventPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextStyle menuItemStyle = const EventStyle(fontSize: 15.0, color: Colors.black54, height: 24.0/15.0);

  double _getAppBarHeight(BuildContext context) => MediaQuery.of(context).size.height * 0.3;

  @override
  Widget build(BuildContext context) {
    // The full page content with the recipe's image behind it. This
    // adjusts based on the size of the screen. If the recipe sheet touches
    // the edge of the screen, use a slightly different layout.
    final double appBarHeight = _getAppBarHeight(context);
    final Size screenSize = MediaQuery.of(context).size;
    final bool fullWidth = screenSize.width < _kRecipePageMaxWidth;
    return new Scaffold(
      key: _scaffoldKey,
      body: new Stack(
        children: <Widget>[
          new Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            height: appBarHeight + _kFabHalfSize,
            child: new Hero(
              tag: widget.recipe.imagePath,
              child: new Image.asset(
                widget.recipe.imagePath,
                fit: fullWidth ? BoxFit.fitWidth : BoxFit.cover,
              ),
            ),
          ),
          new CustomScrollView(
            slivers: <Widget>[
              new SliverAppBar(
                expandedHeight: appBarHeight - _kFabHalfSize,
                backgroundColor: Colors.transparent,
                actions: <Widget>[
                  new PopupMenuButton<String>(
                    onSelected: (String item) {},
                    itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                      _buildMenuItem(Icons.share, 'Tweet recipe'),
                      _buildMenuItem(Icons.email, 'Email recipe'),
                      _buildMenuItem(Icons.message, 'Message recipe'),
                      _buildMenuItem(Icons.people, 'Share on Facebook'),
                    ],
                  ),
                ],
                flexibleSpace: const FlexibleSpaceBar(
                  background: const DecoratedBox(
                    decoration: const BoxDecoration(
                      gradient: const LinearGradient(
                        begin: const Alignment(0.0, -1.0),
                        end: const Alignment(0.0, -0.2),
                        colors: const<Color>[const Color(0x60000000), const Color(0x00000000)],
                      ),
                    ),
                  ),
                ),
              ),
              new SliverToBoxAdapter(
                  child: new Stack(
                    children: <Widget>[
                      new Container(
                        padding: const EdgeInsets.only(top: _kFabHalfSize),
                        width: fullWidth ? null : _kRecipePageMaxWidth,
                        child: new EventSheet(recipe: widget.recipe),
                      ),
                    ],
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }

  PopupMenuItem<String> _buildMenuItem(IconData icon, String label) {
    return new PopupMenuItem<String>(
      child: new Row(
        children: <Widget>[
          new Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: new Icon(icon, color: Colors.black54)
          ),
          new Text(label, style: menuItemStyle),
        ],
      ),
    );
  }
}

/// 展示 card 内部详细信息 渲染。Displays the recipe's name and instructions.
class EventSheet extends StatelessWidget {
  final TextStyle titleStyle = const EventStyle(fontSize: 34.0);
  final TextStyle descriptionStyle = const EventStyle(fontSize: 15.0, color: Colors.black54, height: 24.0/15.0);
  final TextStyle itemStyle = const EventStyle(fontSize: 15.0, height: 24.0/15.0);
  final TextStyle itemAmountStyle = new EventStyle(fontSize: 15.0, color: _kTheme.primaryColor, height: 24.0/15.0);
  final TextStyle headingStyle = const EventStyle(fontSize: 16.0, fontWeight: FontWeight.bold, height: 24.0/15.0);

  EventSheet({ Key key, this.recipe }) : super(key: key);

  final Event recipe;

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new SafeArea(
        top: false,
        bottom: false,
        child: new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
          child: new Table(
            columnWidths: const <int, TableColumnWidth>{
              0: const FixedColumnWidth(64.0)
            },
            children: <TableRow>[
              new TableRow(
                  children: <Widget>[
                    new TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: new Image.asset(
                            recipe.ingredientsImagePath,
                            width: 32.0,
                            height: 32.0,
                            alignment: Alignment.centerLeft,
                            fit: BoxFit.scaleDown
                        )
                    ),
                    new TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: new Text(recipe.name, style: titleStyle)
                    ),
                  ]
              ),
              new TableRow(
                  children: <Widget>[
                    const SizedBox(),
                    new Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                        child: new Text(recipe.description, style: descriptionStyle)
                    ),
                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Card 类
class Event {
  const Event({
    this.name,
    this.author,
    this.description,
    this.imagePath,
    this.ingredientsImagePath,
  });

  final String name;
  final String author;
  final String description;
  final String imagePath;
  final String ingredientsImagePath;
}

//card的集合数组
const List<Event> kEventRecipes = const <Event>[
  const Event(
    name: 'Information Sessions for Admission 2019', //card的标题
    author: '4 December 2018  6:30-8:00pm', //card的小标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: "Please join our information session on 4 December 2018 and find out if the Master of Science in Computer Science Programme is the right fit for your career goals. The information session will include a presentation on overview of the programme and a Q&A session, plus the opportunity to talk informally with the Programme Director afterwards. All potential applicants are welcome.\n\nDate:  4 December 2018\n\nTime:  6:30-8:00pm\n\nVenue:  Theatre A, G/F, Chow Yei Ching Building, The University of Hong Kong, Pokfulam Road",
    imagePath: 'res/images/logos/MScCSLOGO_orange-bg1.png',
  ),
  const Event(
    name: 'Post Exhibition of MSc(CompSc) Dissertations ', //card的标题
    author: 'November 14 & 15, 2018', //card的小标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: "Every semester, a poster exhbition is held to showcase the work of our MSc(CompSc) students on their dissertations.\n\nThe coming exhibition will be held on November 14 & 15, 2018. This exhibition mainly features the work from the students finishing their dissertations in semester 1, 2018-19.  Students will share their experience on the spot.\n\nAll people are welcome!\n\nDate:  November 14, 2018\n\nSession A - 10:00 – 13:00\n\nSession B - 14:00 – 17:00\n\nVenue:  3/F, The Jockey Club Tower, Central Podium Level, HKU Centennial Campus\n\nDate:  November 15, 2018\n\nSession C - 10:00 – 13:00\n\nVenue:  3/F, The Jockey Club Tower, Central Podium Level, HKU Centennial Campus",
    imagePath: 'res/images/logos/MScCSLOGO_orange-bg2.png',
  ),
  const Event(
    name: 'Post Exhibition of MSc(CompSc) Dissertations', //card的标题
    author: 'July 5, 2018', //card的小标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: "Every semester, a poster exhbition is held to showcase the work of our MSc(CompSc) students on their dissertations.\n\nThe coming exhibition will be held on July 5, 2018. This exhibition mainly features the work from the students finishing their dissertations in summer semester, 2017-18.  Students will share their experience on the spot.\n\nAll people are welcome!\n\nDate:  July 5, 2018\n\nSession A - 10:00 – 13:00\n\Session B - 14:00 – 17:00\n\nVenue:  G/F, Chow Yei Ching Building, HKU",
    imagePath: 'res/images/logos/MScCSLOGO_orange-bg3.png',
  ),
];