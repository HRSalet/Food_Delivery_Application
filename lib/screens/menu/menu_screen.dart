import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/menu/tabs/desserts_tab.dart';
import 'package:food_delivery_app/screens/menu/tabs/drinks_tab.dart';
import 'package:food_delivery_app/screens/menu/tabs/meals_tab.dart';
import 'package:food_delivery_app/screens/menu/tabs/snacks_tab.dart';
import 'package:food_delivery_app/screens/menu/tabs/vegan_tab.dart';
import 'package:tab_container/tab_container.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF5CB58),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  color: Color(0XFFE95322),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: TabContainer(
                  controller: _tabController,
                  borderRadius: BorderRadius.circular(20),
                  tabBorderRadius: BorderRadius.circular(20),
                  childPadding: const EdgeInsets.all(30.0),
                  curve: Curves.easeInOut,
                  selectedTextStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                  unselectedTextStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 13.0,
                  ),
                  colors: List<Color>.filled(5, Colors.white),
                  tabMaxLength: 100,
                  tabExtent: 80,
                  tabsStart: 0,
                  tabsEnd: 1,
                  tabs: [
                    Container(
                      width: 60,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color(0XFFF3E9B5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Image.asset("assets/images/category/Snacks.png"),
                    ),
                    Container(
                      width: 60,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color(0XFFF3E9B5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Image.asset("assets/images/category/Meals.png"),
                    ),
                    Container(
                      width: 60,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color(0XFFF3E9B5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Image.asset("assets/images/category/Vegan.png"),
                    ),
                    Container(
                      width: 60,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color(0XFFF3E9B5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Image.asset("assets/images/category/Desserts.png"),
                    ),
                    Container(
                      width: 60,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color(0XFFF3E9B5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Image.asset("assets/images/category/Drinks.png"),
                    ),
                  ],
                  children: [
                    SnacksTab(),
                    MealsTab(),
                    VeganTab(),
                    DessertsTab(),
                    DrinksTab(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
