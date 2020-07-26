import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_app/lists/main_list.dart';

// Image slider and menu list

List<String> imgList = [
  'assets/1.jpg',
  'assets/2.jpg',
  'assets/3.jpg',
  'assets/4.jpg',
  'assets/5.jpg',
  'assets/6.jpg',
];

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, context){
                setState(() {
                  _count = index;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map((url){
              int index = imgList.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _count == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
//          MainList(),
        ],
    );
  }

List<Widget> imageSliders = imgList.map((itm) => Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      child: Stack(
        children: <Widget>[
          Image.asset(itm, fit: BoxFit.cover, width: 1000.0),
          Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                  )
                ),
              ),
          ),
        ],
      ),
    ),
  ),
)).toList();
}

