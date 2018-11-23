import 'package:flutter/material.dart';
import 'package:flutter_app_hku/widgets/swiper.dart';

class AboutHKU extends StatelessWidget{
  final String appTitle = 'About HKU';

  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      children: [
        AspectRatio(
          aspectRatio: 16.0 / 9.0,
          child: Swiper(
            indicatorAlignment: AlignmentDirectional.bottomEnd,
            speed: 400,
            indicator: CircleSwiperIndicator(),
            children: <Widget>[
              Image.asset("res/images/pic/WhyHKU.jpg",fit: BoxFit.fill,),
            ],
          ),
        ),
        new Column(
          children: <Widget>[
            new Text('The University of Hong Kong'),
            new Text(' '),
            new Text('The University of Hong Kong (HKU), founded in 1911, is the oldest of Hong Kong’s institutions of higher learning.  It was also the alma mater of Dr. Sun Yat-sen, the founder of modern China.'),
            new Text(' '),
            new Text('HKU, as a pre-eminent international university, seeks to sustain and enhance its excellence as an institution of higher learning through outstanding teaching and world-class research so as to produce well-rounded graduates with lifelong abilities to provide leadership within the societies they serve.'),
            new Text(' '),
            new Text('HKU has ten faculties, a graduate school and a number of independent centres of studies and learning. In 2016-17, it had a student population of over 27,800, including over 16,100 undergraduates and 11,700 postgraduates, and an academic staff population of around 3,400. Coupled with an active alumni network and generous endowments for programme research and development, HKU is a dynamic and exciting institution. Stepping into Asia’s next century of phenomenal growth.')
          ],
        ),
      ],

    );
  }
}