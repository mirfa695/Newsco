import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newsco/custom_widgets/custom_container.dart';
import 'package:newsco/custom_widgets/custom_search_bar.dart';
import 'package:newsco/provider/api_provider.dart';
import 'package:newsco/routing/route_name.dart';
import 'package:newsco/screens/Navigation/home_page/tabs/healthy_page.dart';
import 'package:newsco/utilities/const_colors.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: SizedBox(
              height: 45,
              child: Row(
                children: [
                  const Expanded(
                    child:CustomSearchBar()
                  ),
                  RawMaterialButton(
                    onPressed: () {},
                    elevation: 2.0,
                    fillColor: ConstColors.constrColor,
                    padding: const EdgeInsets.all(10.0),
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.notification_add_outlined,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                ' Latest News',
                style: TextStyle(
                    fontFamily: 'NewYork',
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1),
              ),
              const Spacer(),
              InkWell(onTap: (){
                Navigator.pushNamed(context, RouteName.allNewsPage);
              },
                child: Text(
                  'See All ',
                  style: TextStyle(color: ConstColors.constbColor),
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: ConstColors.constbColor,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // FutureBuilder(future: context.read<ApiProvider>().fetchApi(), builder: (context,snapshot){
          //   if(snapshot.hasData){}return null;
          // }),
          CarouselSlider(
              items: [
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.newsDetails);
                    },
                    child: CustomContainer(
                      image:
                          'https://media.cnn.com/api/v1/images/stellar/prod/230822164110-mexico-bus-crash-0822.jpg?c=original',
                      text1: '16 dead and 36 injured after bus carrying migrants and locals crashes in Mexico, officials say',
                      text: 'By Mirfa',
                      text2: 'At least 16 people have been killed and 36 more injured',
                    )),
                CustomContainer(
                image:
                'https://www.livemint.com/lm-img/img/2023/07/06/1600x900/ASSIGNMENT-NAME-IN-BRIEF-7_1688177030463_1688616599444.jpg',
                ),
                CustomContainer(
                  image:
                  'https://media.cnn.com/api/v1/images/stellar/prod/230822164110-mexico-bus-crash-0822.jpg?c=original',
                )
              ],
              options: CarouselOptions(
                enlargeFactor: .15,
                initialPage: 0,
                enlargeCenterPage: true,
                viewportFraction: .87,
                aspectRatio:16/9,
                enableInfiniteScroll: false
              )),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 43,
            child: ButtonsTabBar(

              unselectedDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                color: Colors.black,
                width: 1,
              ),
                  color: Colors.white),
              contentPadding: const EdgeInsets.all(9),

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),

                  color: ConstColors.constrColor),
              labelStyle: const TextStyle(
                color: Colors.white,
              ),
              unselectedLabelStyle: const TextStyle(
                color: Colors.black,
              ),
              borderColor: Colors.white,
              borderWidth: .5,
              controller: _tabController,
              tabs:  const [
                Tab(text: 'Healthy'),
                Tab(
                  text: 'Technology',
                ),
                Tab(
                  text: 'Finance',
                ),
                Tab(
                  text: 'Arts',
                ),
                Tab(
                  text: 'Science',
                ),
                Tab(
                  text: 'Space',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(controller: _tabController,
                children: const [
              HealthyPage(),
              Text( 'hei'),
              Text('dbj'),
              Text('bxcu',
              ),
              Text(
                 'bxcu',
              ),
              Text(
                 'bxcu',
              ),
            ]),
          )
        ],
      ),
    ));
  }
}
