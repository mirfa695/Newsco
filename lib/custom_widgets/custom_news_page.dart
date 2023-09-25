import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:newsco/utilities/const_colors.dart';

class CustomNewsPage extends StatelessWidget {
  CustomNewsPage(
      {this.image,
      this.place,
      this.detailNews,
      this.Date,
      this.Heading,
      this.Publisher,
      Key? key})
      : super(key: key);
  String? image;
  String? place;
  String? detailNews;
  String? Date;
  String? Heading;
  String? Publisher;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ConstColors.constrColor,
        child: const Icon(Icons.favorite_border),
      ),
      body: Column(
        children: [
          Stack(clipBehavior: Clip.none, children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(image ?? ''), fit: BoxFit.cover)),
            ),
            Positioned(
                top: 30,
                left: 10,
                child: SizedBox(
                    width: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ))),
            Positioned(
              top: 190,
              child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white),
                  height: 400,
                  width: 355,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        Flexible(
                            child: Text.rich(
                          TextSpan(children: [
                            TextSpan(
                                text: '$place: ',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                              text: '$detailNews',
                            )
                          ]),
                          textAlign: TextAlign.justify,
                        )),
                      ],
                    ),
                  )),
            ),
            Positioned(
              bottom: -60,
              left: 50,
              child: Container(
                width: 280,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.black.withOpacity(.3),
                      Colors.white.withOpacity(.8)
                    ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Date ?? 'Unknown Date',
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w200),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        Heading ?? 'No News',
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'NewYork',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Published by $Publisher',
                        style: const TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
