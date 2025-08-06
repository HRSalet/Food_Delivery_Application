import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/contact/contact_us_screen.dart';
import 'package:food_delivery_app/screens/faq/faq_screen.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF5CB58),
      appBar: AppBar(
        toolbarHeight: 100.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.deepOrange,
          ),
        ),
        backgroundColor: Colors.transparent,
        title: Column(
          children: [
            Text(
              "Help Center",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 25,
                color: Color(0XFFF8F8F8),
              ),
            ),
            Text(
              "How can we help you?",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
                color: Colors.deepOrange,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(
            child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: Color(0XFFF5F5F5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                    child: TabBar(
                      controller: _tabController,
                      labelColor: Colors.white,
                      indicator: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.transparent,
                      unselectedLabelColor: Color(0XFFE95322),
                      labelStyle: TextStyle(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 16,
                      ),
                      tabs: [
                        Tab(child: Center(child: Text("FAQ"))),
                        Tab(child: Center(child: Text("Contact Us"))),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [FaqScreen(), ContactUsScreen()],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
