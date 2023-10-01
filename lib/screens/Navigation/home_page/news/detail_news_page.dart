import 'package:flutter/material.dart';
import 'package:newsco/model_class/class_article.dart';
import 'package:newsco/utilities/const_colors.dart';

class DetailNewsPage extends StatelessWidget {
   String? title;
   DetailNewsPage({this.title,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(title);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ConstColors.constrColor,
        child: const Icon(Icons.favorite_border),
      ),
      body:
      Column(
        children: [
          Stack(clipBehavior: Clip.none, children: [
            Container(
              height: 200,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage('https://tse4.explicit.bing.net/th?id=OIP.PvRNjx7IKYXeUvR9F98lkAHaGq&pid=Api&P=0&h=180'), fit: BoxFit.cover)),
            ),
            Positioned(
                top: 30,
                left: 10,
                child: SizedBox(
                    width: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        Flexible(
                            child: Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                    text: ' ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text: '',
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
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                         'Unknown Date',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w200),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'No News',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'NewYork',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Published by ',
                        style: TextStyle(fontSize: 10),
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
