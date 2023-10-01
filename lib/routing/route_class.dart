import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsco/routing/route_name.dart';
import 'package:newsco/screens/Navigation/home_page/see_all_tabs/all_news_page.dart';
import 'package:newsco/screens/Navigation/home_page/news/detail_news_page.dart';
import 'package:newsco/screens/Navigation/my_profile_page.dart';
import 'package:newsco/screens/Navigation/profile_page.dart';
import 'package:newsco/screens/entry_page/entry_page.dart';
import 'package:newsco/screens/Navigation/home_page/home_page.dart';
import 'package:newsco/screens/Navigation/nav_page.dart';
import 'package:newsco/screens/overview_page.dart';

class RouteClass{

static Route<dynamic> generateRoute(RouteSettings settings){
switch(
settings.name
){
  case  RouteName.loginRoute:return MaterialPageRoute(builder: (context)=>const EntryPage());
  case  RouteName.homeRoute:return MaterialPageRoute(builder: (context)=>const NavPage());
  case RouteName.newsDetails:return MaterialPageRoute(builder: (context)=> DetailNewsPage());
  case RouteName.allNewsPage:return MaterialPageRoute(builder: (context)=>const SeeAllPage());
  case RouteName.profileRoute:return MaterialPageRoute(builder: (context)=>const MyProfilePage());
  default:return MaterialPageRoute(builder: (context)=>const Overview());
}
}
}