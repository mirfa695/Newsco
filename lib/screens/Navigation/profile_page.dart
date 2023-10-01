import 'package:flutter/material.dart';
import 'package:newsco/provider/entry_provider.dart';
import 'package:newsco/routing/route_name.dart';
import 'package:newsco/utilities/const_colors.dart';
import 'package:newsco/utilities/const_elavatedbutton.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
            'Profile',
            style: TextStyle(
                fontSize: 30,
                fontFamily: 'Newyork',
                letterSpacing: 2,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          )),
        ),
        const SizedBox(height: 40,),
        SizedBox(height: 50,width: 320,
            child: OutlinedButton(onPressed: (){
              Navigator.pushNamed(context, RouteName.profileRoute);
            }, child: const Row(
              children: [
                Icon(Icons.account_circle_outlined,color: Colors.black,),
                SizedBox(width: 10,),
                Text('Your Profile',style: TextStyle(color: Colors.black),),

              ],
            ))),
        const SizedBox(height: 10,),
        SizedBox(height: 50,width: 320,
            child: OutlinedButton(onPressed: (){}, child: const Row(
              children: [
                Icon(Icons.notifications_none_outlined,color: Colors.black,),
                SizedBox(width: 10,),
                Text('Notifications',style: TextStyle(color: Colors.black),),

              ],
            ))),
        const SizedBox(height: 10,),
        SizedBox(height: 50,width: 320,
            child: OutlinedButton(onPressed: (){}, child: const Row(
              children: [
                Icon(Icons.share,color: Colors.black,),
                SizedBox(width: 10,),
                Text('Share',style: TextStyle(color: Colors.black),),

              ],
            ))),
        const SizedBox(height: 10,),
        SizedBox(height: 50,width: 320,
            child: OutlinedButton(onPressed: (){}, child: const Row(
              children: [
                Icon(Icons.settings,color: Colors.black,),
                SizedBox(width: 10,),
                Text('Settings',style: TextStyle(color: Colors.black),),

              ],
            ))),

        const SizedBox(height: 50,),
        SizedBox(
          width: 200,
            child: ElevatedButton(onPressed: ()  {
              showDialog(context: context,
                builder: (context)=>
                    AlertDialog(title: const Text('Log Out'),content: const Text('Are you sure to Log out'),
                 actions: [
                   TextButton(
                     onPressed: () async {
                       await context.read<EntryProvider>().setBool(false);
                       await context.read<EntryProvider>().signOut();
                       Navigator.pushNamed(context, RouteName.loginRoute);
                     }, child: const Text('Yes')),
                   TextButton(onPressed: (){
                   Navigator.pop(context);
                 }, child: const Text('No'))],),
              );
              // Navigator.pushNamed(context, RouteName.loginRoute);
              },style: ConstEButton.Ebutton, child: const Text('Log Out'),))
      ],
    ));
  }
}
