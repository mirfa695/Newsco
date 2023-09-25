import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newsco/custom_widgets/custom_container.dart';
import 'package:newsco/services/api_service.dart';
class DemoPage extends StatelessWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: ApiServices().getdata(), builder: (context,snapshot){
       if(snapshot.hasData){
         {
           return Container(height: 720,
             child: ListView.separated(
           separatorBuilder: (context, index) => SizedBox(
               height: 10,),
                 itemBuilder: (BuildContext context,int index){
               return Container(height: 214,
                 child: CustomContainer(text: snapshot.data["articles"][index]["author"],image: snapshot.data["articles"][index]["urlToImage"],
                 text1: snapshot.data["articles"][index]["title"],text2: snapshot.data["articles"][index]["content"],),
               );
             }, itemCount: snapshot.data["articles"].length,),
           );
           // return CustomContainer(text: snapshot.data["articles"][2]["title"],image: snapshot.data["articles"][2]["urlToImage"],);
         }
       }else{return const Text('Error');}
          }
          ),
    );
  }
}
