import 'package:flutter/material.dart';
import 'package:flutter_app_hku/widgets/swiper.dart';

class AlumniAssociation extends StatelessWidget{
  final String appTitle = 'About HKU';
  final TextStyle titleStyle = const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      children: [
        new Text('\nMSc(CompSc) Alumni Association\n',style: titleStyle,),
        AspectRatio(
          aspectRatio: 16.0 / 9.0,
          child: Swiper(
            indicatorAlignment: AlignmentDirectional.bottomEnd,
            speed: 400,
            indicator: CircleSwiperIndicator(),
            children: <Widget>[
              Image.asset("res/images/pic/GradDinner2017-2.jpg",fit: BoxFit.fill,),
            ],
          ),
        ),
        new Column(
          children: <Widget>[
            new Text('\nHKU is a journey, not a destination. When you left HKU, you are not alone for the rest of your life because you have the alumni association, your powerful backing forever.'),
            new Text(' '),
            new Text('The MSc(CompSc) Alumni Association strengthens the bonding and communication among our graduates, facilitates resources sharing and thus fulfills the responsibilities of being an HKU alumni. We aim at practicing the motto "Sapience and Virtue", working in unity, helping each other, contributing to our alma mater and serving the community.'),
            new Text(' '),
            new Text('Our Alumni Association is not only the heritage of HKU, but also the wealth throughout our whole lives. It actively recruits not just new graduates each year. It also invites new and current students to join the big family before their graduation. Currently, we have bases throughout China, including Hong Kong, Beijing, Shanghai, Shenzhen and Chengdu. Every student who has studied the MSc(CompSc) programme can find their own home.')
          ],
        ),
      ],

    );
  }
}