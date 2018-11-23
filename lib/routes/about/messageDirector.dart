import 'package:flutter/material.dart';
import 'package:flutter_app_hku/widgets/swiper.dart';

class MessageDirector extends StatelessWidget{
  final String appTitle = 'Message from Programme Director';

  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: const EdgeInsets.symmetric(horizontal: 9.0),
      children: [
        AspectRatio(
          aspectRatio: 9.0 / 9.0,
          child: Swiper(
            indicatorAlignment: AlignmentDirectional.bottomEnd,
            speed: 400,
            indicator: CircleSwiperIndicator(),
            children: <Widget>[
              Image.asset('res/images/teachers/ChowKP-Square.jpg',fit: BoxFit.fill),
            ],
          ),
        ),
        new Column(
          children:<Widget>[
            new Text(' '),
            new Text('We are living in the era where technology is widely accepted and becomes so commonplace that we doubt how we ever live without it. Mobile is a good prominent example. From businesses to individual consumers, everyone is connected to everyone, everywhere, all the time. Every day we hear of new technological breakthroughs, e.g. self-driving cars, organ-on-a-chip, smart glasses, drones; they are awe-inspiring. To remain in the game, the best IT professionals strive to maintain current knowledge and skills to take on these continual developments.'),
            new Text(' '),
            new Text('The Master of Science in Computer Science Programme is a comprehensive and challenging graduate programme with three specialisations and one general stream, namely Financial Computing Stream, Cyber Security Stream, Multimedia Computing Stream and General Computer Science Stream, to meet the needs of both industry and business in Asia, and to make the programme more unique among comparable programmes in the region.'),
            new Text(' '),
            new Text('As you can see from our curriculum, on one hand we have retained the nuts and bolts subjects to lay a strong foundation. But on the other hand, we updated and revised the curriculum continuously as we assess the career trends and needs of our students, and monitor rapid changes in technology developments. For example, hot topics like “fintech”, “blockchain” are included in some of our courses.'),
            new Text(' '),
            new Text('If you like the holistic approach of our teaching methods and curriculum, please consider enrolling in this established programme in a world-class university.'),
            new Text(' '),
            new Text('Dr. K.P. Chow'),
            new Text('Programme Director')
          ],
          
          
        ),
      ],

    );
  }
}