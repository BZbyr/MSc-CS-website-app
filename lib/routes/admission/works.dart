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
                  return ListView(
                    children: <Widget>[
                      new Text('\nWhen you enrol in the MSc(CompSc) Programme, you gain all the advantages of a famous university with an outstanding reputation. When you leave our Programme, you will have a solid foundation in the theoretical aspect of computer science, together with hands-on technical experience in information technology, to help you begin a rewarding career.\n\n But a master’s programme does not have to be the last chapter of your learning merely technical, hard-core information technology; it can serve as a springboard to other career opportunities and learning challenges. For example, many of our graduates who find themselves moving into management, may continue their studies towards an MBA degree, while others may go on to doctoral studies here at HKU or elsewhere.\n\n Some of our students and graduates would also like to share their experience with you.'),
                    ],
                  );
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
                        new Text(recipe.name, style: titleStyle),
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
  const Recipe(
    name: 'Miss Cui Yitong', //card的标题
    author: '2017 graduate', //card的小标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: "Studying in HKU MSc(CompSc) has prepared me for success in a couple of ways.  First, MSc(CompSc) offers a range of courses tailored to meet the specific academic and professional goals of each student.  Most of the hot topics are involved, such as Machine Learning, Data Mining, Deep Learning, Cloud Computing, Blockchain technology, etc.  When I do job-hunting, I find the courses have really offered help to me down-to-earth.  The programme also gives me much resources of knowledge and job opportunities.  Second, the strict requirements of each course induce me to be hard-working all the time, and provide me with many advanced learning skills.  The teamwork tasks gave me opportunity to know more about my classmates, who are down-to-earth and humble.\n\nCountless sleepless nights in HKU MSc(CompSc)  made me a better person.  It was an incredible experience that I don't think I could have anywhere else.",
    imagePath: 'res/images/students/work/photo_Cui Yitong_1.jpg',
  ),
  const Recipe(
    name: 'Mr. Hu Tianyi', //card的标题
    author: '2016 graduate', //card的小标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: "In the past year, I benefit a lot from tough courses in this program, which makes up my deficiency in coding experience and brings me edge-cutting knowledge. Meanwhile, the design of four streams helps me concentrate on the study of computational finance. Comparing with programs in other universities, I think numerous opportunities provided by this program is a great advantage. Some teachers are from teaching staff with strong research experience while others are from industry with enrich working experience, meaning that communicating with them positively can bring us extra benefits. Furthermore, thanks to the reputation of the University of Hong Kong, we have access to many competitions, one of which is Rotman International Trading Competition held in Toronto competing with other top universities among the world. Through those competitions, I make friends with experienced algo traders and they also teach me much beyond the book, which enhance my will to work in this industry. \n\nAll in all, this program is really fruitful, and students from different background can get what they want. But the study period is short, I think designing the study plan on first day is important and necessary. Just be open and outgoing, the precious opportunity is around us.",
    imagePath: 'res/images/students/work/HuTianyi_Bruce.jpg',
  ),
  const Recipe(
    name: 'Mr. Lee Lip Tong', //card的标题
    author: '2017 graduate', //card的小标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: 'There are a wide range of courses to choose from - AI, cybersecurity and financial computing to name a few. The course contents are up to date and HKU provides quality resources so that the learning process is smooth and unhindered.  The best part about the MSc programme is perhaps the people that you meet - I’ve made many friends with similar interest and drive.  We also have down-to-earth professors who are willing to dedicate time and effort to introduce current concepts and topics relevant to the industry.  On top of having a rigorous and well laid out curriculum, studying at HKU gives me an enjoyable and dynamic student life.  I am able to easily meet people entering or already working in the tech industry and I’m also able to practice and learn both Cantonese and Mandarin due to the diversity of students.  Lastly, Hong Kong provides a fun and safe place to study and is ideally located to immerse oneself into what is perhaps the world’s largest and most sophisticated mecca of technology - the Greater Bay Area."',
    imagePath: 'res/images/students/work/photo_Lee Lip Tong.jpg',
  ),
  const Recipe(
    name: 'Mr. Lee Tin Yun', //card的标题
    author: '2016 graduate', //card的小标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: "Read Financial Times in mid-August this year and you will see the new trend in the hedge fund world - DIY algo traders. The emerging new platforms, say Quantiacs, allow the tech talent to show off and get money at home without working in hedge funds. However, regardless of being a full-time or a part-time DIY trader, you need to have strong knowledge in both finance and computer science. In addition to courses in computer science, HKU MSc(CompSc) offers a range of courses with duo-foci on both areas of knowledge. My study in HKU MSc(CompSc) benefits me a lot and greatly prepares me for catching the new trend. I strongly recommend others having the same goal apply to this programme.",
    imagePath: 'res/images/students/work/Philip Lee.jpg',
  ),
  const Recipe(
    name: 'Mr. Liang Xingchi', //card的标题
    author: '2017 student', //card的小标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: "I started from scratch to build my financial block when I come to HKU to take the first financial-computing-stream course.  Its starting point is pretty friendly to a finance freshman and enables me to follow up smoothly. One-year hard work later, I found that I have a good grasp of computer science and financial area and therefore obtain many summer internship offers from Hong Kong financial institutions.  If you are eager to dive into the FinTech subject, MSc(CompSc) programme (financial computing stream) is exactly your best option.",
    imagePath: 'res/images/students/work/Photo_Liang Xingchi.jpg',
  ),
  const Recipe(
    name: 'Mr. Stoffregen Florian', //card的标题
    author: '2017 graduate', //card的小标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: "The University of Hong Kong (HKU) provides students with the opportunity to tailor their courses of study to fit their future career motivations. This significant deviation from standard programmes enables the future graduates to strengthen their talents and have a smooth transition into the business world.\n\nFurthermore, the HKU Professors strive to teach only up to date and current concepts, never missing the chance to give advice in order to guarantee that their students will be able to provide sophisticated solutions at the end of each course.",
    imagePath: 'res/images/students/work/Stoffregen.jpg',
  ),
  const Recipe(
    name: 'Miss Vidyantininggrum Karina', //card的标题
    author: '2018 graduate', //card的小标题
    ingredientsImagePath: 'res/images/logos/MScCSLOGO_dark-bg.png', //小logo路径
    description: "I have always had a strong interest in Fintech.  With Hong Kong being the global financial hub of Asia, gaining finance-related expertise here is always an aspiration of mine.  I was very excited when I came across MSc in Computer Science programme at HKU.  Not only does the Programme offer a lot of interesting courses in IT, it also provides a stream of my interest: Financial Computing stream.  Throughout the course of my study, I was exposed to courses which not only are useful in the field of Fintech but also introduce very relevant knowledge to recent industries’ needs.  The faculty members whom I was taught and supervised by were knowledgeable and resourceful.  They could explain very complex information in ways students can easily understand.  It was a very motivating experience to learn first-hand from these industries experts.  HKU also constantly gave us opportunities to attend seminars and talks and encouraged us to join competitions to increase our competitiveness and exposure to the outside world.  This Programme also let me work on a dissertation project.  I believe that dissertation provides a very good opportunity to showcase my interests and knowledge into a single portfolio.  I chose a topic and materials that strongly resonate with my aspiration.  Not only did I feel accomplished after completing it, but it is also one of the first items on my resume that appeal to potential employers.",
    imagePath: 'res/images/students/work/photo_Karina Vidyantiningrum.JPG',
  ),
];
