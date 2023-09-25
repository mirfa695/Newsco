import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
   CustomContainer({this.image,this.text,this.text1,this.text2,
    Key? key}) : super(key: key);
  String? image;
  String? text;
   String? text1;
   String? text2;
  @override
  Widget build(BuildContext context) {
    return Container(height: double.infinity,width:double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
        image: DecorationImage(

          image:  NetworkImage(image??''),fit: BoxFit.cover)
      ),child: Container(decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: LinearGradient(colors: [
        Colors.black.withOpacity(.6),
      Colors.white.withOpacity(.2)],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter)
    ),child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const SizedBox(height: 60,),
         text != null ?  Align(alignment: Alignment.topLeft,
             child: Text(text!,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 10),)) : const SizedBox(),
          Text(text1??'no data',style: const TextStyle(color: Colors.white,fontFamily: 'NewYork',fontSize: 16,fontWeight: FontWeight.bold,letterSpacing: 1),),
            const Spacer(),
          Text(text2??'no data',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 10),),
        ],
      ),
    ),),
    );
  }
}
