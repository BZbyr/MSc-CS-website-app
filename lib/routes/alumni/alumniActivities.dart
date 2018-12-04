import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AlumniActivities extends StatelessWidget{
  final String appTitle = 'Words from Students and Graduates';
  const AlumniActivities({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) => new AlumniActivitiesHome();

}

const double _kFabHalfSize = 28.0; // TODO: needs to adapt to screen size
const double _kRecipePageMaxWidth = 500.0;

final ThemeData _kTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  accentColor: Colors.amber,
);

class AlumniActivitiesHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const AlumniActivitiesPage(news: kAlumniActivities);
  }
}

class AlumniActivitiesStyle extends TextStyle {
  const AlumniActivitiesStyle({
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
class AlumniActivitiesPage extends StatefulWidget {
  const AlumniActivitiesPage({ Key key, this.news }) : super(key: key);

  final List<Activity> news;

  @override
  _AlumniActivitiesPageState createState() => new _AlumniActivitiesPageState();
}

class _AlumniActivitiesPageState extends State<AlumniActivitiesPage> {
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
            final Activity recipe = widget.news[index];
            return new AlumniActivitiesCard(
              aNew: recipe,
              onTap: () { showRecipePage(context, recipe); },
            );
          },
          childCount: widget.news.length,
        ),
      ),
    );
  }

  void showRecipePage(BuildContext context, Activity recipe) {
    Navigator.push(context, new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return new Theme(
          data: _kTheme.copyWith(platform: Theme.of(context).platform),
          child: new AlumniActivityPage(recipe: recipe),
        );
      },
    ));
  }
}


// A card with the recipe's image, author, and title.
class AlumniActivitiesCard extends StatelessWidget {
  final TextStyle titleStyle = const AlumniActivitiesStyle(fontSize: 24.0, fontWeight: FontWeight.w600);
  final TextStyle authorStyle = const AlumniActivitiesStyle(fontWeight: FontWeight.w500, color: Colors.black54);

  const AlumniActivitiesCard({ Key key, this.aNew, this.onTap }) : super(key: key);

  final Activity aNew;
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
class AlumniActivityPage extends StatefulWidget {
  const AlumniActivityPage({ Key key, this.recipe }) : super(key: key);

  final Activity recipe;

  @override
  _AlumniActivityPageState createState() => new _AlumniActivityPageState();
}

//每个card主页面渲染
class _AlumniActivityPageState extends State<AlumniActivityPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextStyle menuItemStyle = const AlumniActivitiesStyle(fontSize: 15.0, color: Colors.black54, height: 24.0/15.0);

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
                        child: new AlumniActivitySheet(recipe: widget.recipe),
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
class AlumniActivitySheet extends StatelessWidget {
  final TextStyle titleStyle = const AlumniActivitiesStyle(fontSize: 34.0);
  final TextStyle descriptionStyle = const AlumniActivitiesStyle(fontSize: 15.0, color: Colors.black54, height: 24.0/15.0);
  final TextStyle itemStyle = const AlumniActivitiesStyle(fontSize: 15.0, height: 24.0/15.0);
  final TextStyle itemAmountStyle = new AlumniActivitiesStyle(fontSize: 15.0, color: _kTheme.primaryColor, height: 24.0/15.0);
  final TextStyle headingStyle = const AlumniActivitiesStyle(fontSize: 16.0, fontWeight: FontWeight.bold, height: 24.0/15.0);

  AlumniActivitySheet({ Key key, this.recipe }) : super(key: key);

  final Activity recipe;

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
class Activity {
  const Activity({
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
const List<Activity> kAlumniActivities = const <Activity>[
  const Activity(
    name: '2017 Christmas Party in Shanghai', //card的标题
    author: 'Thursday, December 28, 2017', //card的小标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: "HKU MSc(CompSc) Shanghai Alumni Association organized a Christmas party on 23 Dec 2017. 25 alumni from Class 2012 to Class 2015 joined the party to celebrate Christmas together.\n\nThe alumni association made thoughtful preparations and arrangements for this party. Besides preparing ice breaking games and delicious food, the alumni association also featured something special to enrich the party, such as signing names on the specially customized signature board, delivering sincere blesses to each other through cards and ribbons, receiving gifts from 'Santa Claus', listening to the gingerbread man's story. All parts went with exquisitely conceived details, which made the time more productive and enjoyable. The links between alumni were strengthened, and they all shared a memorable and convivial ",
    imagePath: 'res/images/alumniActivity/Alumni-SH-Christmas2_s.jpg',
  ),
  const Activity(
    name: 'Graduation Dinner 2017', //card的标题
    author: 'Friday, December 1, 2017', //card的小标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: "Graduates of Class 2017 of the MSc(CompSc) programme celebrated and shared their joy of achievement with teachers at the Graduation Dinner held on 1 December 2017. \n\nThe inauguration ceremony of the MSc(CompSc) Alumni Association was also held at the dinner.  Dr KP Chow, the Programme Director, presented the alumni flag to the President and directors of the alumni association to represent the establishment of the HKU MSc(CompSc) Alumni Association.\n\nMoreover, 95 graduates cast their votes for the 'My Favourite Teachers' election during the dinner.  Dr TW Chim, Dr KP Chow, Dr Dirk Schnieders and Professor CL Wang were neck and neck and shared the honour.\n\nLet's congratulate our MSc(CompSc) graduates for their accomplishments.  Special thanks to Wang Dazhi and Pan Yunan for representing Class 2017 as the MCs of the dinner.",
    imagePath: 'res/images/alumniActivity/GradDinner2017-1-m.jpg',
  ),
  const Activity(
    name: 'Visiting Business Incubators in Shenzhen', //card的标题
    author: 'Sunday, November 12, 2017', //card的小标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: "To better learn about the innovation and technology development in Shenzhen in recent years, HKU MSc(CS) Hong Kong and Shenzhen Alumni Associations jointly organized a visit to Shenzhen Innovation Park on 12th November 2017.\n\nThere were over 40 students and alumni joining this visit, which offered a brand new vision of Tencent WeStart and Simplywork, SZ-HK College Innovation Base.  Among these innovation institutions, various policies and support were provided to students who are devoted to start-up careers.",
    imagePath: 'res/images/alumniActivity/Alumni-SZ1.jpg',
  ),
  const Activity(
    name: 'Alumni Get-Together in Shanghai', //card的标题
    author: 'Wednesday, October 18, 2017', //card的小标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: "The first dinner party of HKU MSc(CS) Shanghai Alumni was held on 17th Oct 2017 in Shanghai.  Dr. KP Chow, Professor Choli Wang, Dr. Dirk Schnieders were invited to witness this event.  There were 12 alumni joining this party.\n\nWith the presence of three faculties, alumni shared their study life in HKU and MSc, a memorable and delighted experience to build their career and guide them to thrive in Shanghai.  They introduced themselves, made new friends, shared their work experience and life after graduation with each other at the party.  Everyone left their signatures on a memorable signature paper and took photo with each other.  It was an enjoyable and impressive gathering.",
    imagePath: 'res/images/alumniActivity/Alumni-SH1.jpg',
  ),
  const Activity(
    name: 'Celebrate the National Day and Mid-Autumn Festival', //card的标题
    author: 'Tuesday, October 3, 2017', //card的小标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: "HKU MSc(CompSc) HK Alumni Association held an outdoor gathering to celebrate the National Day and Mid-Autumn Festival at IFC Roof Garden on 2nd Oct 2017.  26 alumni and students joined this harmonious event.  They ate mooncakes, played games and enjoyed the great night view of Hong Kong's skyline.\n\nIt was a great opportunity for everyone to make new friends and alleviate the feeling of loneliness as being away from family. Freshmen can also get some support and be more comfortable to face upfront challenges of studying at HKU.",
    imagePath: 'res/images/alumniActivity/AlumniIFC-1.jpg',
  ),
  const Activity(
    name: 'Welcome Event for New Students', //card的标题
    author: 'Monday, September 18, 2017', //card的小标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: "On 17th September, HKU MSc(CS) HK Alumni Association held the event of hiking to the Victoria Peak for 2017 new students.  To encourage new students to enjoy the campus life and make more friends, HK Alumni Association, led by Mr. Wilson Wu, the president, and Ms. Stacy. Min, the vice president, organized a small sharing session at the Peak about how to balance study and life and discover more in this metropolitan city.\n\nThere were 41 new students and alumni joining this event as the first official activity organized by HK Alumni Association.",
    imagePath: 'res/images/alumniActivity/Alumni-WelcomClimb1.jpg',
  ),
];