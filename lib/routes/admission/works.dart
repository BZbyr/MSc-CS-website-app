import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Works extends StatelessWidget{
  final String appTitle = 'Words from Students and Graduates';
  const Works({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) => new PestoHome();

}

const double _kFabHalfSize = 28.0; // TODO: needs to adapt to screen size
const double _kRecipePageMaxWidth = 500.0;

final ThemeData _kTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  accentColor: Colors.amber,
);

class PestoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const RecipeGridPage(recipes: kPestoRecipes);
  }
}

class PestoStyle extends TextStyle {
  const PestoStyle({
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
class RecipeGridPage extends StatefulWidget {
  const RecipeGridPage({ Key key, this.recipes }) : super(key: key);

  final List<Recipe> recipes;

  @override
  _RecipeGridPageState createState() => new _RecipeGridPageState();
}

class _RecipeGridPageState extends State<RecipeGridPage> {
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
              switch(index){
                case 0:
                  return new Text('When you enrol in the MSc(CompSc) Programme, you gain all the advantages of a famous university with an outstanding reputation. When you leave our Programme, you will have a solid foundation in the theoretical aspect of computer science, together with hands-on technical experience in information technology, to help you begin a rewarding career.\n\n But a master’s programme does not have to be the last chapter of your learning merely technical, hard-core information technology; it can serve as a springboard to other career opportunities and learning challenges. For example, many of our graduates who find themselves moving into management, may continue their studies towards an MBA degree, while others may go on to doctoral studies here at HKU or elsewhere.\n\n Some of our students and graduates would also like to share their experience with you.');
                  break;
              }
              final Recipe recipe = widget.recipes[index-1];
              return new RecipeCard(
                recipe: recipe,
                onTap: () { showRecipePage(context, recipe); },
              );
            },
            childCount: widget.recipes.length+1,
          ),
        ),
      );
  }

  void showRecipePage(BuildContext context, Recipe recipe) {
    Navigator.push(context, new MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return new Theme(
          data: _kTheme.copyWith(platform: Theme.of(context).platform),
          child: new RecipePage(recipe: recipe),
        );
      },
    ));
  }
}


// A card with the recipe's image, author, and title.
class RecipeCard extends StatelessWidget {
  final TextStyle titleStyle = const PestoStyle(fontSize: 24.0, fontWeight: FontWeight.w600);
  final TextStyle authorStyle = const PestoStyle(fontWeight: FontWeight.w500, color: Colors.black54);

  const RecipeCard({ Key key, this.recipe, this.onTap }) : super(key: key);

  final Recipe recipe;
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
                        new Text(recipe.name, style: titleStyle, softWrap: false, overflow: TextOverflow.ellipsis),
                        new Text(recipe.author, style: authorStyle),
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
class RecipePage extends StatefulWidget {
  const RecipePage({ Key key, this.recipe }) : super(key: key);

  final Recipe recipe;

  @override
  _RecipePageState createState() => new _RecipePageState();
}

//每个card主页面渲染
class _RecipePageState extends State<RecipePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextStyle menuItemStyle = const PestoStyle(fontSize: 15.0, color: Colors.black54, height: 24.0/15.0);

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
                        child: new RecipeSheet(recipe: widget.recipe),
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
class RecipeSheet extends StatelessWidget {
  final TextStyle titleStyle = const PestoStyle(fontSize: 34.0);
  final TextStyle descriptionStyle = const PestoStyle(fontSize: 15.0, color: Colors.black54, height: 24.0/15.0);
  final TextStyle itemStyle = const PestoStyle(fontSize: 15.0, height: 24.0/15.0);
  final TextStyle itemAmountStyle = new PestoStyle(fontSize: 15.0, color: _kTheme.primaryColor, height: 24.0/15.0);
  final TextStyle headingStyle = const PestoStyle(fontSize: 16.0, fontWeight: FontWeight.bold, height: 24.0/15.0);

  RecipeSheet({ Key key, this.recipe }) : super(key: key);

  final Recipe recipe;

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
class Recipe {
  const Recipe({
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
const List<Recipe> kPestoRecipes = const <Recipe>[
  const Recipe(
    name: 'Mr. Clark Matthew William', //card的标题
    author: '2017 graduate', //card的小标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: "After studying and working for several years in the United States, I chose to do my Master's degree at HKU based on the sterling reputation that the University and the CS programme have around the world. Having the flexibility to design my own studies and select interesting courses as well as having the opportunity to learn from top professors really appealed to me. The coursework was challenging yet fulfilling, and topics were relevant for today's fast-changing world. I have been able to work with cutting-edge robotic systems during my dissertation project, and I am excited to begin a new career in the technology field armed with my MSc from HKU.",
    imagePath: 'res/images/students/work/Clark.jpg',
  ),
];
