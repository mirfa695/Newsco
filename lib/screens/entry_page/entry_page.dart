import 'package:flutter/material.dart';
import 'package:newsco/screens/entry_page/login_page.dart';
import 'package:newsco/screens/entry_page/register_page.dart';
import 'package:newsco/utilities/const_colors.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
      body: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 280,
              height: 200,
              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/img.png'),fit: BoxFit.fill)),),
          ),
          SizedBox(

            height: 50,
            child: Material(color: ConstColors.constrColor,
              child: TabBar(
                labelColor:ConstColors.constrColor,
                unselectedLabelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Colors.white),
                tabs: const [Text('SIGN IN',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  Text('SIGN UP',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)],controller: _tabController,),
            ),

          ),
          Card(
            child: Container(
              height: 400,width: 320,
              child: TabBarView(
                controller: _tabController,
                children: [
                LoginPage(),
                RegisterPage()
              ],),
            ),
          )
        ],
      ),
    );
  }
}
