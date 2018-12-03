import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class News extends StatelessWidget{
  final String appTitle = 'Words from Students and Graduates';
  const News({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) => new NewsHome();

}

const double _kFabHalfSize = 28.0; // TODO: needs to adapt to screen size
const double _kRecipePageMaxWidth = 500.0;

final ThemeData _kTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  accentColor: Colors.amber,
);

class NewsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const NewsGridPage(news: kNewRecipes);
  }
}

class NewStyle extends TextStyle {
  const NewStyle({
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
class NewsGridPage extends StatefulWidget {
  const NewsGridPage({ Key key, this.news }) : super(key: key);

  final List<New> news;

  @override
  _NewsGridPageState createState() => new _NewsGridPageState();
}

class _NewsGridPageState extends State<NewsGridPage> {
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
            final New recipe = widget.news[index];
            return new NewCard(
              aNew: recipe,
              onTap: () { showRecipePage(context, recipe); },
            );
          },
          childCount: widget.news.length,
        ),
      ),
    );
  }

  void showRecipePage(BuildContext context, New recipe) {
    Navigator.push(context, new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return new Theme(
          data: _kTheme.copyWith(platform: Theme.of(context).platform),
          child: new NewPage(recipe: recipe),
        );
      },
    ));
  }
}


// A card with the recipe's image, author, and title.
class NewCard extends StatelessWidget {
  final TextStyle titleStyle = const NewStyle(fontSize: 24.0, fontWeight: FontWeight.w600);
  final TextStyle authorStyle = const NewStyle(fontWeight: FontWeight.w500, color: Colors.black54);

  const NewCard({ Key key, this.aNew, this.onTap }) : super(key: key);

  final New aNew;
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
class NewPage extends StatefulWidget {
  const NewPage({ Key key, this.recipe }) : super(key: key);

  final New recipe;

  @override
  _NewPageState createState() => new _NewPageState();
}

//每个card主页面渲染
class _NewPageState extends State<NewPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextStyle menuItemStyle = const NewStyle(fontSize: 15.0, color: Colors.black54, height: 24.0/15.0);

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
                        child: new NewSheet(recipe: widget.recipe),
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
class NewSheet extends StatelessWidget {
  final TextStyle titleStyle = const NewStyle(fontSize: 34.0);
  final TextStyle descriptionStyle = const NewStyle(fontSize: 15.0, color: Colors.black54, height: 24.0/15.0);
  final TextStyle itemStyle = const NewStyle(fontSize: 15.0, height: 24.0/15.0);
  final TextStyle itemAmountStyle = new NewStyle(fontSize: 15.0, color: _kTheme.primaryColor, height: 24.0/15.0);
  final TextStyle headingStyle = const NewStyle(fontSize: 16.0, fontWeight: FontWeight.bold, height: 24.0/15.0);

  NewSheet({ Key key, this.recipe }) : super(key: key);

  final New recipe;

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
class New {
  const New({
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
const List<New> kNewRecipes = const <New>[
  const New(
    name: 'Admission 2019', //card的标题
    author: 'Tuesday, October 16, 2018', //card的小标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: "The MSc(CompSc) admission for 2019 September intake now opens. For details, please refer to the admission section.",
    imagePath: 'res/images/news/Admission.jpg',
  ),
  const New(
    name: 'HKU CS Career Fair on September 18, 2018', //card的标题
    author: 'Friday, September 21, 2018', //card的小标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: "The MSc Programme Office organized the Career Fair on 18 September 2018, aiming to provide students and alumni a great opportunity to meet the representatives of companies, learn more about the organization, the positions available and their hiring criteria.  We were honoured to have 8 companies participating in the Career Fair, some of whom also happen to be our alumni.  They gave our students insights of the industry, let them have a better understanding of the opportunities they could grasp and be more prepared. \n\nWe would like to take this opportunity to thank all the participating companies, as well as student/alumni helpers, for their time and effort, and dedication to our students. ",
    imagePath: 'res/images/news/CareerFair2018Sep-5.jpg',
  ),
  const New(
    name: 'MSc(CompSc) Welcoming Reception 2018', //card的标题
    author: 'Sunday, September 2, 2018', //card的小标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: "The Welcoming Reception for Cohort 2018 MSc(CompSc) students was held at Wang Gungwu Lecture Theatre on 30 August 2018.\n\nIn additional to greeting by Dr KP Chow, the Programme Director, and Professor TW Lam, the Head of Department, many teachers joined this event and gave a brief introduction of the courses to students.  The Hong Kong Police Force was invited to talk about anti-deception.\n\nA group of MSc(CompSc) graduates also joined this welcoming reception and shared their experience with new students.",
    imagePath: 'res/images/news/WelcomingReception2018-1.jpg',
  ),
  const New(
    name: 'HKU CS Career Talk on March 19, 2018', //card的标题
    author: 'Monday, March 19, 2018', //card的小标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: "The MSc Programme Office organized a career talk for current CS students on 19 March 2018. It was our pleasure to have the representatives from Meituan-Dianping, Microsoft Hong Kong Limited and Deloitte, to tell us about their organizations, the positions available and their hiring criteria.\n\nHKU MSc(CS) Alumni Association also invited alumni from various industries to share their career experience as well as the expertise needed for future jobs.  Students were greatly benefited from the alumni’s sharing on their invaluable working experience and job hunting strategies.",
    imagePath: 'res/images/news/CareerTalk2018Mar-2.jpg',
  ),
];

