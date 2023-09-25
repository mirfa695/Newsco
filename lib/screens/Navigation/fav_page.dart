import 'package:flutter/material.dart';
import 'package:newsco/custom_widgets/custom_overview_container.dart';
import 'package:newsco/utilities/const_colors.dart';

class FavPage extends StatelessWidget {
  const FavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,title: Text('Favorites',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: ConstColors.constrColor),),
        leading: const Icon(Icons.arrow_back,color: Colors.black,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          CustomOverviewContainer(
            image: 'https://cdn.bollywoodmdb.com/fit-in/500x700/post/ParineetiChopraAndRaghavChadha8_1694681377172.jpg',
            date: '12 October 2022',
            heading: 'Parineeti Chopra And Raghav Chadha’s Wedding',
            news: 'Actress Parineeti Chopra and Aam Aadmi Party (AAP) politician Raghav Chadha are due to marry on September 24 in Udaipur, Rajasthan, in the presence of their families and close friends.',
            name: 'Bollywood MDM team',
          ),
          const SizedBox(height: 20,),
          CustomOverviewContainer(
            image: 'https://images.livemint.com/img/2022/12/27/1600x900/Avatar2_1671128713768_1672101266292_1672101266292.jpg',
            date: '27 Dec 2022',
            heading: 'Avatar 2 Crosses Over 7000 Crores',
            news: "With USD 855 million (equivalent to INR 7,000 crores) in worldwide ticket sales after 10 days in theatres, Disney and 20th Century's high-budget epic 'Avatar: The Way of Water' has become the fifth-highest grossing film of the year.",
            name: 'ANI',
          )
        ],),
      ),
    );
  }
}
