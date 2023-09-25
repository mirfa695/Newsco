import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:newsco/screens/Navigation/profile_page.dart';
import 'package:newsco/screens/Navigation/fav_page.dart';
import 'package:newsco/screens/Navigation/home_page/home_page.dart';
import 'package:newsco/utilities/const_colors.dart';

class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int pageIndex = 0;

  final pages = [
    const HomePage(),
    const FavPage(),
    const ProfilePage(),
  ];
  void _updateIndex(int value) {
    setState(() {
      pageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      extendBody: true,
      bottomNavigationBar: DotNavigationBar(
        unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          selectedItemColor: ConstColors.constrColor,
          items: [
            DotNavigationBarItem(icon: const Icon(Icons.home)),
          DotNavigationBarItem(icon: const Icon(Icons.favorite)),
          DotNavigationBarItem(icon: const Icon(Icons.account_circle))],
        currentIndex: pageIndex,
        onTap: _updateIndex,),
    );
  }
}
