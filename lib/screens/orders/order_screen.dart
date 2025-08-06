import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/orders/order_tabs/active_tab.dart';
import 'package:food_delivery_app/screens/orders/order_tabs/cancelled_tab.dart';
import 'package:food_delivery_app/screens/orders/order_tabs/completed_tab.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF5CB58),
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
                    padding: EdgeInsets.only(top: 20),
                    child: TabBar(
                      controller: _tabController,
                      labelColor: Colors.white,
                      indicator: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(70),
                      ),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.transparent,
                      unselectedLabelColor: Color(0XFFE95322),
                      labelStyle: TextStyle(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 18,
                      ),
                      tabs: [
                        Tab(child: Center(child: Text("Active"))),
                        Tab(child: Center(child: Text("Completed"))),
                        Tab(child: Center(child: Text("Cancelled"))),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [ActiveTab(), CompletedTab(), CancelledTab()],
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
