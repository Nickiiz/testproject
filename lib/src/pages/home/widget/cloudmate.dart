// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter_fullstack/src/pages/login/login_page.dart';
import 'package:learn_flutter_fullstack/src/pages/pages.dart';

class CloudMate extends StatefulWidget {
  const CloudMate({super.key});

  @override
  State<CloudMate> createState() => _CloudMateState();
}

class _CloudMateState extends State<CloudMate> {
  List<String> _imagePublicRelations = [
    'assets/images/image4.png',
    'assets/images/image5.png',
    'assets/images/image6.png',
  ];

  int _carouselCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              CarouselSlider.builder(
                itemCount: _imagePublicRelations.length,
                options: CarouselOptions(
                  height: 300,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  onPageChanged: (index, reason) {
                    setState(
                      () {
                        _carouselCurrentIndex = index;
                      },
                    );
                  },
                ),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ActivityPage(),
                          ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              _imagePublicRelations[index],
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              DotsIndicator(
                dotsCount: _imagePublicRelations.length,
                // position: _carouselCurrentIndex,
                decorator: DotsDecorator(
                  activeColor: Colors.amber,
                  activeSize: Size(18, 10),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.2,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text('หัวข้อกิจกรรม'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
