import 'package:flutter/material.dart';
import 'package:newsco/provider/firestore_provider.dart';
import 'package:newsco/utilities/const_colors.dart';
import 'package:provider/provider.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(color: ConstColors.constrColor),
              child: const Center(
                  child: Text(
                    'My Profile',
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Newyork',
                        letterSpacing: 2,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            const SizedBox(height: 40,),
           FutureBuilder(future: context.read<FirestoreProvider>().getUser(context),
               builder: ( context,snapshot){
             if(snapshot.hasData){
                return Column(
                  children: [
                    Container(
                      height: 50,width: 300,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(width: 1)),
                      child:  Row(
                        children: [
                          Container(height: 50,width: 100,decoration:
                          BoxDecoration(color: ConstColors.constrColor,
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),topLeft: Radius.circular(10))),
                          child: Center(child: Text('Name',style: TextStyle(color: Colors.white,fontSize: 18),)),),
                          SizedBox(width: 20,),
                          Text(snapshot.data!.data()!["name"].toString()),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: 50,width: 300,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(width: 1)),
                      child:  Row(
                        children: [
                          Container(height: 50,width: 100,decoration:
                          BoxDecoration(color: ConstColors.constrColor,
                              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10),topLeft: Radius.circular(10))),
                            child: const Center(child: Text('Email',style: TextStyle(color: Colors.white,fontSize: 18),)),),
                          const SizedBox(width: 20,),
                          Text(snapshot.data!.data()!["email"].toString()),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      height: 50,width: 300,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(width: 1)),
                      child:  Row(
                        children: [
                          Container(height: 50,width: 100,decoration:
                          BoxDecoration(color: ConstColors.constrColor,
                              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10),topLeft: Radius.circular(10))),
                            child: Center(child: Text('D/O/B',style: TextStyle(color: Colors.white,fontSize: 18),)),),
                          SizedBox(width: 20,),
                          Text(snapshot.data!.data()!["dob"].toString()),
                        ],
                      ),
                    ),
                  ],
                );
             }else{print('no data');}
             return const Text("Error");
               })
          ],
        ));
  }
}
