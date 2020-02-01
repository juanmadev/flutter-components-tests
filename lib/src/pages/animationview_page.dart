import 'package:componentes/src/pages/hero_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AnimationViewPage extends StatefulWidget {
  AnimationViewPage({Key key}) : super(key: key);

  @override
  _AnimationViewPageState createState() => _AnimationViewPageState();
}

class _AnimationViewPageState extends State<AnimationViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animaciones test'),
      ),
      body: Center(
        child: _getBody(),
      ),
    );
  }

  Widget _getBody() {
    return CarouselSlider(
      // height: 400.0,
      // viewportFraction: 0.8,
      aspectRatio: 0.9,
      enableInfiniteScroll: false,
      initialPage: 0,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,

      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                print('item clicked $i');

                var route = new MaterialPageRoute(
                  builder: (BuildContext context) => new HeroPage(item: '$i'),
                );
                Navigator.of(context).push(route);

                // Navigator.pushNamed(
                //   context,
                //   'hero',
                //   arguments: MaterialPageRoute(
                //     builder: (context) => HeroPage(
                //       item: 'TEST',
                //     ),
                //   ),
                // );
              },
              child: Hero(
                tag: 'card$i',
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/galaxystock.jpg"),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'ELEMENTO $i',
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
