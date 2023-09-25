import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newsco/provider/api_provider.dart';
import 'package:newsco/provider/entry_provider.dart';
import 'package:newsco/provider/firestore_provider.dart';
import 'package:newsco/provider/sharedprefeence_provider.dart';
import 'package:newsco/routing/route_class.dart';
import 'package:newsco/routing/route_name.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
bool? auth;
Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences spref=await SharedPreferences.getInstance();
  auth=spref.getBool('isLoggedIn')??false;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<EntryProvider>(
          create: (context) => EntryProvider()),
      ChangeNotifierProvider<FirestoreProvider>(create: (context)=>FirestoreProvider()),
      ChangeNotifierProvider<SharedPreferenceProvider>(create: (context)=>SharedPreferenceProvider()),
      ChangeNotifierProvider<ApiProvider>(create: (context)=>ApiProvider())
    ],
    child: const Main(),
  ));
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(auth);
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
     initialRoute:auth==true? RouteName.homeRoute: RouteName.loginRoute,
      onGenerateRoute: RouteClass.generateRoute,
    );
    // routes: {
    //     RouteName.homeRoute : (context) => NavPage(),
    //   RouteName.overviewRoute : (context) => Overview(),
    //   RouteName.allNewsPage:(context)=>SeeAllPage(),
    //   RouteName.NewsDetails:(context)=>DetailNewsPage()
    // });
  }
}
