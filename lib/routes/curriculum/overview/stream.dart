import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Stream extends StatelessWidget{
  final String appTitle = 'Words from Students and Graduates';
  const Stream({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) => new StreamHome();

}

const double _kFabHalfSize = 28.0; // TODO: needs to adapt to screen size
const double _kRecipePageMaxWidth = 500.0;

final ThemeData _kTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  accentColor: Colors.amber,
);

class StreamHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const StreamsPage(news: kStreams);
  }
}

class StreamStyle extends TextStyle {
  const StreamStyle({
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
class StreamsPage extends StatefulWidget {
  const StreamsPage({ Key key, this.news }) : super(key: key);

  final List<Streams> news;

  @override
  _StreamsPageState createState() => new _StreamsPageState();
}

class _StreamsPageState extends State<StreamsPage> {
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
            final Streams recipe = widget.news[index];
            return new StreamCard(
              aNew: recipe,
              onTap: () { showRecipePage(context, recipe); },
            );
          },
          childCount: widget.news.length,
        ),
      ),
    );
  }

  void showRecipePage(BuildContext context, Streams recipe) {
    Navigator.push(context, new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return new Theme(
          data: _kTheme.copyWith(platform: Theme.of(context).platform),
          child: new StreamPage(recipe: recipe),
        );
      },
    ));
  }
}


// A card with the recipe's image, author, and title.
class StreamCard extends StatelessWidget {
  final TextStyle titleStyle = const StreamStyle(fontSize: 24.0, fontWeight: FontWeight.w600);
  final TextStyle authorStyle = const StreamStyle(fontWeight: FontWeight.w500, color: Colors.black54);

  const StreamCard({ Key key, this.aNew, this.onTap }) : super(key: key);

  final Streams aNew;
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
                        new Text(aNew.name, style: titleStyle),
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
class StreamPage extends StatefulWidget {
  const StreamPage({ Key key, this.recipe }) : super(key: key);

  final Streams recipe;

  @override
  _StreamPageState createState() => new _StreamPageState();
}

//每个card主页面渲染
class _StreamPageState extends State<StreamPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextStyle menuItemStyle = const StreamStyle(fontSize: 15.0, color: Colors.black54, height: 24.0/15.0);

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
                        child: new StreamSheet(recipe: widget.recipe),
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
class StreamSheet extends StatelessWidget {
  final TextStyle titleStyle = const StreamStyle(fontSize: 34.0);
  final TextStyle descriptionStyle = const StreamStyle(fontSize: 15.0, color: Colors.black54, height: 24.0/15.0);
  final TextStyle itemStyle = const StreamStyle(fontSize: 15.0, height: 24.0/15.0);
  final TextStyle itemAmountStyle = new StreamStyle(fontSize: 15.0, color: _kTheme.primaryColor, height: 24.0/15.0);
  final TextStyle headingStyle = const StreamStyle(fontSize: 16.0, fontWeight: FontWeight.bold, height: 24.0/15.0);

  StreamSheet({ Key key, this.recipe }) : super(key: key);

  final Streams recipe;

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
class Streams {
  const Streams({
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
const List<Streams> kStreams = const <Streams>[
  const Streams(
    name: 'Cyber Security', //card的标题
    author: 'Thursday, December 28, 2017', //card的小标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: "The Cyber Security Stream is a multidisciplinary area of study and professional activity concerned with state-of-the-art technology in cyber security. The curriculum covers different aspects of cyber security from different perspectives, including technical, organisational, human-oriented and legal.",
    imagePath: 'res/images/pic/InformationSecurity.jpg',
  ),
  const Streams(
    name: 'Multimedia Computing', //card的标题
    author: '', //card的小标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: "The Multimedia Computing Stream focuses on multimedia computing, communications, analytics, visualisation and applications.\n\nMultimedia Computing encompasses media coding and processing, streaming-media middleware, media representations, real-time protocols, media analysis, and human-interaction and visualisation techniques.\n\nStudents are encouraged to develop innovative ideas using the latest development in technology such as mobile devices and big-data analytics.",
    imagePath: 'res/images/pic/MultimediaComputing.jpg',
  ),
  const Streams(
    name: 'Financial Computing', //card的标题
    author: 'Thursday, December 28, 2017', //card的小标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: "The Financial Computing Stream is the study of data and algorithms used in finance and the mathematics of computer programs that realise financial models or systems.\n\nFinancial Computing emphasises practical numerical methods and focuses on techniques that are directly applicable to business and financial analysis.\n\nThe emphasis will be in the computing aspect of the financial industry.",
    imagePath: 'res/images/pic/FinancialComputing.jpg',
  ),
  const Streams(
    name: 'General Stream', //card的标题
    author: 'Thursday, December 28, 2017', //card的小标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: "The General Stream covers a broad, comprehensive range of Computer Science subjects, including a wide range of courses from which students can choose from. It offers students the most flexibility to design their own study portfolio based on their career aspiration or requirements.",
    imagePath: 'res/images/pic/GeneralStream.jpg',
  ),
];