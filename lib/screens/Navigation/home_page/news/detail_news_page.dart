import 'package:flutter/cupertino.dart';
import 'package:newsco/custom_widgets/custom_news_page.dart';

class DetailNewsPage extends StatelessWidget {
  const DetailNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNewsPage(image: 'https://media.cnn.com/api/v1/images/stellar/prod/230822164110-mexico-bus-crash-0822.jpg?c=original',
    place: 'Moscow',detailNews: 'At least 16 people have been killed and 36 more in following a bus crash Tuesday on central Mexico’s Cuacnopalan-Oaxaca highway,according to officia The bus, which was carrying locals and migrants, collided with a trailer truck on the highway near the border between the states of Oaxaca and Puebl Oaxaca’s Prosecutor’s Office said in a statement. The traffic accident killed at least eight men and eight women, including one minor. The injured were transferred to hospitals in Puebla for medical attention.',
    Date: '12 September 2023',Heading: ' 16 people have been killed and 36 more injured following a bus crash',Publisher: 'Mirfa',);
  }
}
