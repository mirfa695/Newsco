import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsco/utilities/const_colors.dart';
import 'package:readmore/readmore.dart';

class CustomOverviewContainer extends StatelessWidget {
  CustomOverviewContainer(
      {this.image, this.date, this.heading, this.news, this.name, Key? key})
      : super(key: key);
  String? image;
  String? date;
  String? heading;
  String? news;
  String? name;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image ?? 'No image'),
                  fit: BoxFit.cover)),
        ),
        Text(
          date ?? 'No date',
          style: const TextStyle(
              color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
            child: Text(
          heading ?? 'No news',
          style: const TextStyle(
              fontSize: 14,
              fontFamily: 'NewYork',
              fontWeight: FontWeight.bold),
        )),
        const SizedBox(
          height: 5,
        ),
        ReadMoreText(
          news ?? 'No Details',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          trimLines: 2,
          colorClickableText: ConstColors.constbColor,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Read more',
          trimExpandedText: 'Show less',
          moreStyle: TextStyle(fontSize: 14, color: ConstColors.constbColor),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Published By $name',
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w200),
        )
      ],
    );
  }
}
