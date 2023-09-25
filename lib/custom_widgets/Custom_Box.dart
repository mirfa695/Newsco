import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  CustomBox({this.image, this.text, this.text1, this.text2, Key? key})
      : super(key: key);
  String? image;
  String? text;
  String? text1;
  String? text2;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(image ??
                  'https://tse3.mm.bing.net/th?id=OIP.gLDQbKOuZV8D33EJV8sR0QHaHa&pid=Api&P=0&h=180'),
              fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              Colors.black.withOpacity(.6),
              Colors.grey.withOpacity(.6)
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              text != null
                  ? Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        text!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'NewYork',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ))
                  : const SizedBox(),
              const Spacer(),
              Row(
                children: [
                  Flexible(
                      child: Text(
                    text1 ?? 'no data',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  )),
                  const Spacer(),
                  Text(
                    text2 ?? 'no data',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
