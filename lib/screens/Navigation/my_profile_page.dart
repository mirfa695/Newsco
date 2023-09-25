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
           FutureBuilder(future: context.read<FirestoreProvider>().getData(),
               builder: ( context,snapshot){
             if(snapshot.hasData){
                     print(snapshot.data!);
                return Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(width: 1)),
                  child:  Text(snapshot.data!.data()!["email"].toString()),
                );
             }else{print('no data');}
             return const Text("Error");
               })
          ],
        ));
  }
}
