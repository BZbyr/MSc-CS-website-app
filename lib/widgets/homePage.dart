import 'package:flutter/material.dart';
import 'package:flutter_app_hku/widgets/drawerWidget.dart';
import 'package:flutter_app_hku/widgets/swiper.dart';

class HomePage extends StatelessWidget {

  final String appTitle = 'MSc(CS)';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: appTitle,
      home: new Home(),
    );
  }
}

class Home extends StatelessWidget{
  const Home({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) => new homeHome();

}

const double _kFabHalfSize = 28.0; // TODO: needs to adapt to screen size
const double _kRecipePageMaxWidth = 500.0;

final ThemeData _kTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  accentColor: Colors.amber,
);

class homeHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const HomeGridPage(recipes: kHomeAds);
  }
}

class HomeStyle extends TextStyle {
  const HomeStyle({
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
class HomeGridPage extends StatefulWidget {
  const HomeGridPage({ Key key, this.recipes }) : super(key: key);

  final List<HomeAd> recipes;

  @override
  _HomeGridPageState createState() => new _HomeGridPageState();
}

class _HomeGridPageState extends State<HomeGridPage> {
  final String appTitle = "Master of Science in Computer Science, HKU";
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextStyle titleStyle = const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return new Theme(
        data: _kTheme.copyWith(platform: Theme.of(context).platform),
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text(appTitle,),
          ),
          key: scaffoldKey,
          body: new CustomScrollView(
            slivers: <Widget>[
              _buildBody(context, statusBarHeight),
            ],
          ),
          drawer: new Drawer(
            child: new DrawerWidget(),
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
            switch(index){
              case 0:
                return ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: [
                    AspectRatio(
                      aspectRatio: 16.0 / 9.0,
                      child: Swiper(
                        indicatorAlignment: AlignmentDirectional.bottomEnd,
                        speed: 400,
                        indicator: CircleSwiperIndicator(),
                        children: <Widget>[
                          Image.asset("res/images/pic/Slider1.jpg",fit: BoxFit.fill,),
                          Image.asset("res/images/pic/Slider_Admission.jpg",fit: BoxFit.fill,),
                        ],
                      ),
                    ),
                    new Column(
                      children: <Widget>[
                        new Text('\nProgramme Overview\n',style: titleStyle,),
                        new Text('The MSc(CompSc) programme is a comprehensive postgraduate study programme provides advanced and in-depth learning in Computer Science. The programme is credit unit based, with courses of both applied and fundamental nature. Students can choose from a comprehensive and diversified study in Computer Science courses or focussed streams of study. Focussed streams of study represent a cohesive collection of related courses that provides both fundamental and in-depth exposure to students in a given ICT domain.'),
                      ],
                    ),
                  ],
                );
                break;
            }
            final HomeAd recipe = widget.recipes[index-1];
            return new HomeCard(
              recipe: recipe,
              onTap: () { showHomePage(context, recipe); },
            );
          },
          childCount: widget.recipes.length+1,
        ),
      ),
    );
  }

  void showHomePage(BuildContext context, HomeAd recipe) {
    Navigator.push(context, new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return new Theme(
          data: _kTheme.copyWith(platform: Theme.of(context).platform),
          child: new HomeAPage(recipe: recipe),
        );
      },
    ));
  }
}


// A card with the recipe's image, author, and title.
class HomeCard extends StatelessWidget {
  final TextStyle titleStyle = const HomeStyle(fontSize: 24.0, fontWeight: FontWeight.w600);
  final TextStyle authorStyle = const HomeStyle(fontWeight: FontWeight.w500, color: Colors.black54);

  const HomeCard({ Key key, this.recipe, this.onTap }) : super(key: key);

  final HomeAd recipe;
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
              tag: recipe.imagePath,
              child: new Image.asset(
                recipe.imagePath,
                fit: BoxFit.contain,
              ),
            ),
            new Expanded(
              child: new Row(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Image.asset(
                      recipe.ingredientsImagePath,
                      width: 48.0,
                      height: 48.0,
                    ),
                  ),
                  new Expanded(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(recipe.name, style: titleStyle),
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
class HomeAPage extends StatefulWidget {
  const HomeAPage({ Key key, this.recipe }) : super(key: key);

  final HomeAd recipe;

  @override
  _HomeAPageState createState() => new _HomeAPageState();
}

//每个card主页面渲染
class _HomeAPageState extends State<HomeAPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextStyle menuItemStyle = const HomeStyle(fontSize: 15.0, color: Colors.black54, height: 24.0/15.0);

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
                        child: new HomeSheet(recipe: widget.recipe),
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
class HomeSheet extends StatelessWidget {
  final TextStyle titleStyle = const HomeStyle(fontSize: 34.0);
  final TextStyle descriptionStyle = const HomeStyle(fontSize: 15.0, color: Colors.black54, height: 24.0/15.0);
  final TextStyle itemStyle = const HomeStyle(fontSize: 15.0, height: 24.0/15.0);
  final TextStyle itemAmountStyle = new HomeStyle(fontSize: 15.0, color: _kTheme.primaryColor, height: 24.0/15.0);
  final TextStyle headingStyle = const HomeStyle(fontSize: 16.0, fontWeight: FontWeight.bold, height: 24.0/15.0);

  HomeSheet({ Key key, this.recipe }) : super(key: key);

  final HomeAd recipe;

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
class HomeAd {
  const HomeAd({
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
const List<HomeAd> kHomeAds = const <HomeAd>[
  const HomeAd(
    name: 'Programme Schedule', //card的标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: "The MSc(CompSc) programme is offered in both full-time and part-time modes.\n\nThere are 3 semesters in an academic year, i.e. semester 1: September – December, semester 2: January – May and the summer semester: June – August.\n\nPart-time: 2-3 years\Full-time: 1-2 years\n\nClasses are usually conducted in weekday evenings from 7:00 p.m., or during weekends. Some courses will be offered mainly for full-time students in weekday daytime.\n\nFor more information, please click here for details.",
    imagePath: 'res/images/pic/ProgrammeSchedule.jpg',
  ),
  const HomeAd(
    name: 'ApplicationDeadlines.jpg', //card的标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: "Main round: 31 December 2018\n\nClearing round: 12:00nn (HKT), 15 April 2019\n\nTo be considered, you must submit a complete application, with supporting materials uploaded online, before the deadline. ",
    imagePath: 'res/images/pic/ApplicationDeadlines.jpg',
  ),
  const HomeAd(
    name: 'Composition Fees', //card的标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: "The composition fee for each 6-credit course is HK13,000*. Project has a composition fee of HK26,000 and the Dissertation has a composition fee of HK52,000. Total composition fee for the two study modes are therefore as follows:\n\n10 courses + Project:\n(HK13,000 x 10) + (HK26,000) = HK156,000\n\n8 Courses + Dissertation:\n(HK13,000 x 8) + (HK52,000) = HK156,000\n\nFor more information, please click here for details.\n\n * Pending for University's approval",
    imagePath: 'res/images/pic/ProgrammeFees.jpg',
  ),
];

