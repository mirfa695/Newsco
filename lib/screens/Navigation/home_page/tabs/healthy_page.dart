import 'package:flutter/material.dart';
import 'package:newsco/custom_widgets/Custom_Box.dart';

class HealthyPage extends StatelessWidget {
  const HealthyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: ListView(
        children: [
          CustomBox(
            image:
                'https://assets-global.website-files.com/63a1cbc81b0e903002cf9cec/64138bba0f85e33ff06de855_Best%20Stethoscopes%20for%20Nurses.jpg',
            text: 'Doctor Declines',
            text1: 'Mirfa',
            text2: 'Sunday,9 May 2021',
          ),
          const SizedBox(height: 10,),
          CustomBox(
            image:
            'https://d2jx2rerrg6sh3.cloudfront.net/image-handler/picture/2018/7/shutterstock_1100865059.jpg',
            text: 'Outbreak of Nipah virus encephalitis in the Kerala state of India',
            text1: 'Yamuna',
            text2: 'Monday,10 August 2021',
          ),
          const SizedBox(height: 10,),
          CustomBox(
            image:
            'https://www.who.int/images/default-source/wpro/countries/china/health-topics/air-pollution/air-pollution-smoke.tmb-1920v.jpg?Culture=en&sfvrsn=c1d9f99e_6',
            text: 'Air pollution in the South-East Asia Region',
            text1: 'Varun',
            text2: 'Friday,23 October 2022',
          ),
        ],
      ),
    ));
  }
}
