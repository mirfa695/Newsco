import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:newsco/custom_widgets/custom_search_bar.dart';
import 'package:newsco/screens/Navigation/home_page/see_all_tabs/all_tab_page.dart';
import 'package:newsco/screens/Navigation/home_page/see_all_tabs/technology_page.dart';
import '../../../../utilities/const_colors.dart';
import '../tabs/healthy_page.dart';

class SeeAllPage extends StatefulWidget {
  const SeeAllPage({Key? key}) : super(key: key);

  @override
  State<SeeAllPage> createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const CustomSearchBar(),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 43,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  height: 20,
                  width: 90,
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Filter',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w200,
                                            fontSize: 22),
                                      ),
                                      const Spacer(),
                                      OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                              side: const BorderSide(
                                                  color: Colors.black),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20))),
                                          onPressed: () {},
                                          child: const Row(
                                            children: [
                                              Icon(
                                                Icons.delete_outline,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                'Reset',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    'Sort By',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  MultiSelectContainer(
                                      itemsDecoration: MultiSelectDecorations(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 0.1),
                                              borderRadius: const BorderRadius.all(
                                                  Radius.circular(20))),
                                          selectedDecoration: BoxDecoration(
                                              color: ConstColors.constrColor,
                                              border: Border.all(
                                                  color: Colors.white),
                                              borderRadius: const BorderRadius.all(
                                                  Radius.circular(20))),
                                          disabledDecoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: .1),
                                              borderRadius: const BorderRadius.all(
                                                  Radius.circular(20)))),
                                      textStyles: const MultiSelectTextStyles(
                                          disabledTextStyle: TextStyle(color: Colors.black),
                                          selectedTextStyle: TextStyle(color: Colors.white)),
                                      items: [
                                        MultiSelectCard(
                                            value: 'Recommended',
                                            label: 'Recommended'),
                                        MultiSelectCard(
                                            value: 'Latest', label: 'Latest'),
                                        MultiSelectCard(
                                            value: 'Most Viewed',
                                            label: 'Most viewed'),
                                        MultiSelectCard(
                                            value: 'Channel', label: 'channel'),
                                        MultiSelectCard(
                                            value: 'following',
                                            label: 'Following'),
                                      ],
                                      onChange: (allSelectedItems, selectedItem) {}),
                                  const Spacer(),
                                  SizedBox(
                                      width: double.infinity,
                                      height: 40,
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  ConstColors.constrColor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20))),
                                          child: const Text(
                                            'SAVE',
                                            style: TextStyle(fontSize: 16),
                                          )))
                                ],
                              ),
                            );
                          });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ConstColors.constrColor,
                        disabledBackgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: const Row(
                      children: [
                        Icon(Icons.filter_alt_outlined),
                        Text('Filter'),
                      ],
                    ),
                  ),
                ),
                ButtonsTabBar(
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
                  tabs: const [
                    Tab(
                      text: 'All',
                    ),
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
              ],
            ),
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: const [
              AllTabPage(),
              HealthyPage(),
              TechnologyPage(),
              Text('dbj'),
              Text('bxcu'),
              Text('bxcu'),
              Text('bxcu'),
            ]),
          )
        ],
      ),
    );
  }
}
