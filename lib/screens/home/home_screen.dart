import 'dart:ui';

import 'package:animated_bubble_navigation_bar/animated_bubble_navigation_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery_app/providers/cart_provider.dart';
import 'package:food_delivery_app/screens/address/delivery_address.dart';
import 'package:food_delivery_app/screens/authentication/login_screen.dart';
import 'package:food_delivery_app/screens/help/help_center.dart';
import 'package:food_delivery_app/screens/profile/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../favorite/favorite_screen.dart';
import '../help/help_screen.dart';
import '../menu/menu_screen.dart';
import '../orders/order_screen.dart';
import '../payment/payment_screen.dart';
import '../settings/setting_screen.dart';
import 'custom_widgets/custom_appbar.dart';

// MAIN HOME SCREEN
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myCurrentIndex = 0;
  int myIconIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0XFFF5CB58),
      endDrawer: switch (myIconIndex) {
        0 => myProfileCustomDrawer(),
        1 => myNotificationCustomDrawer(),
        2 => myCartCustomDrawer(),
        _ => myProfileCustomDrawer(),
      },
      appBar: CustomAppbar(
        onCartPressed: () {
          setState(() => myIconIndex = 2); // cart drawer
          _scaffoldKey.currentState!.openEndDrawer();
        },
        onNotificationPressed: () {
          setState(() => myIconIndex = 1); // notification drawer
          _scaffoldKey.currentState!.openEndDrawer();
        },
        onProfilePressed: () {
          setState(() => myIconIndex = 0); // profile drawer
          _scaffoldKey.currentState!.openEndDrawer();
        },
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0XFFF5F5F5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: AnimatedBubbleNavBar(
          screens: [
            HomeContentScreen(),
            MenuScreen(),
            FavoriteScreen(),
            OrderScreen(),
            HelpScreen(),
          ],
          menuItems: [
            BubbleItem(label: "Home", icon: CupertinoIcons.house_fill),
            BubbleItem(label: "Menu", icon: FontAwesomeIcons.bowlFood),
            BubbleItem(label: "Favorite", icon: FontAwesomeIcons.solidHeart),
            BubbleItem(label: "Order", icon: CupertinoIcons.doc_text_fill),
            BubbleItem(label: "Help", icon: FontAwesomeIcons.question),
          ],
          initialIndex: myCurrentIndex,
          bubbleDecoration: BubbleDecoration(
            backgroundColor: Colors.deepOrange,
            selectedBubbleBackgroundColor: Colors.green,
            selectedBubbleIconColor: Colors.white,
            iconSize: 30,
            selectedBubbleLabelStyle: TextStyle(
              letterSpacing: 3.0,
              fontFamily: 'LeagueSpartan',
              fontSize: 20,
              color: Colors.white,
            ),
            unSelectedBubbleBackgroundColor: Colors.transparent,
            innerIconLabelSpacing: 3.0,
            screenTransitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: (1 - animation.value) * 10,
                    sigmaY: (1 - animation.value) * 10,
                  ),
                  child: child,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget myProfileCustomDrawer() {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        ),
      ),
      backgroundColor: Colors.deepOrange,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            Center(
              child: SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                        "assets/images/best_seller/bs3.png",
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "John Wick",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontFamily: 'LeagueSpartan',
                          ),
                        ),
                        Text(
                          "johnwick123@gmail.com",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'LeagueSpartan',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    CupertinoIcons.person_alt,
                    color: Colors.deepOrange,
                    size: 25,
                  ),
                ),
                title: Text(
                  "My Profile",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'LeagueSpartan',
                  ),
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DeliveryAddress()),
                );
              },
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    CupertinoIcons.location_solid,
                    color: Colors.deepOrange,
                    size: 25,
                  ),
                ),
                title: Text(
                  "Delivery Address",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'LeagueSpartan',
                  ),
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentScreen()),
                );
              },
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    FontAwesomeIcons.wallet,
                    color: Colors.deepOrange,
                    size: 25,
                  ),
                ),
                title: Text(
                  "Payment Methods",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'LeagueSpartan',
                  ),
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpCenter()),
                );
              },
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    FontAwesomeIcons.phone,
                    color: Colors.deepOrange,
                    size: 25,
                  ),
                ),
                title: Text(
                  "Contact Us",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'LeagueSpartan',
                  ),
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpCenter()),
                );
              },
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    CupertinoIcons.chat_bubble_2_fill,
                    color: Colors.deepOrange,
                    size: 25,
                  ),
                ),
                title: Text(
                  "Help & FAQs",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'LeagueSpartan',
                  ),
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingScreen()),
                );
              },
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.settings,
                    color: Colors.deepOrange,
                    size: 25,
                  ),
                ),
                title: Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'LeagueSpartan',
                  ),
                ),
              ),
            ),
            Divider(),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return customBottomSheet();
                  },
                );
              },
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.logout_outlined,
                    color: Colors.deepOrange,
                    size: 25,
                  ),
                ),
                title: Text(
                  "Log Out",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'LeagueSpartan',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myNotificationCustomDrawer() {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        ),
      ),
      backgroundColor: Colors.deepOrange,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            Center(
              child: SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.notifications, size: 30, color: Colors.white),
                    Text(
                      "Notifications",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(thickness: 1, color: Colors.white),
            ListTile(
              leading: Container(
                width: 40.3,
                height: 40.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  FontAwesomeIcons.utensils,
                  color: Colors.deepOrange,
                ),
              ),
              title: Text(
                "We have add a product you might like.",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(thickness: 1, color: Colors.white),
            ListTile(
              leading: Container(
                width: 40.3,
                height: 40.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(Icons.favorite, color: Colors.deepOrange),
              ),
              title: Text(
                "One of your favorite is on promotion.",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(thickness: 1, color: Colors.white),
            ListTile(
              leading: Container(
                width: 40.3,
                height: 40.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.deepOrange,
                ),
              ),
              title: Text(
                "Your order has been delivered.",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(thickness: 1, color: Colors.white),
            ListTile(
              leading: Container(
                width: 40.3,
                height: 40.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.delivery_dining_outlined,
                  color: Colors.deepOrange,
                ),
              ),
              title: Text(
                "The delivery is on the way.",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(thickness: 1, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget myCartCustomDrawer() {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        ),
      ),
      backgroundColor: Colors.deepOrange,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(height: 80),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      size: 30,
                      color: Colors.deepOrange,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Cart",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Divider(thickness: 1, color: Colors.white),
            SizedBox(height: 20),
            Consumer<CartProvider>(
              builder: (context, provider, _) {
                final hasCartItems = provider.cartItems.isNotEmpty;
                return hasCartItems ? cartItemDisplay(provider) : cartEmpty();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget cartItemDisplay(CartProvider provider) {
    double subtotal = provider.cartItems.fold(
      0.0,
      (sum, item) => sum + (item.productPrice * item.productQuantity),
    );
    double taxFees = 5.00;
    double deliveryFees = 3.00;
    double total = subtotal + taxFees + deliveryFees;
    return Expanded(
      child: Column(
        children: [
          Center(
            child: Text(
              "You have ${provider.cartItems.length} items in the cart",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: provider.cartItems.length,
              itemBuilder: (context, index) {
                final item = provider.cartItems[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        item.productImage,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      item.productName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      "Price: ₹${item.productPrice.toStringAsFixed(2)}\nQty: ${item.productQuantity}",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    trailing: Text(
                      "₹${(item.productPrice * item.productQuantity).toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          // Totals section
          _buildPriceRow("Subtotal", subtotal),
          _buildPriceRow("Tax & Fees", taxFees),
          _buildPriceRow("Delivery Fees", deliveryFees),
          Divider(color: Colors.white70, thickness: 1),
          _buildPriceRow("Total", total, isBold: true),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PaymentScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0XFFF5CB58),
              foregroundColor: Colors.deepOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              fixedSize: Size(165, 33),
            ),
            child: Text(
              "Checkout",
              style: TextStyle(fontFamily: 'Poppins', fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, double value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: isBold ? 16 : 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            "₹${value.toStringAsFixed(2)}",
            style: TextStyle(
              color: Colors.white,
              fontSize: isBold ? 16 : 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget cartEmpty() {
    return Column(
      children: [
        Center(
          child: Text(
            "Your cart is empty",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 80),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 184,
                height: 184,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  icon: Icon(
                    Icons.add_circle_outline_outlined,
                    color: Colors.white,
                    size: 100,
                  ),
                ),
              ),
              Text(
                "Want to add something?",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget customBottomSheet() {
    return Container(
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Are you sure you want to log out?",
              style: TextStyle(fontFamily: 'LeagueSpartan', fontSize: 22),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(153.29, 37),
                    backgroundColor: Color(0XFFFFDECF),
                    foregroundColor: Color(0XFFE95322),
                  ),
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontFamily: 'LeagueSpartan'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(153.29, 37),
                    backgroundColor: Color(0XFFE95322),
                    foregroundColor: Color(0XFFFFFFFF),
                  ),
                  child: Text(
                    "Yes, logout",
                    style: TextStyle(fontFamily: 'LeagueSpartan'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// THIS IS CONTENT OF HOME SCREEN
class HomeContentScreen extends StatefulWidget {
  const HomeContentScreen({super.key});

  @override
  State<HomeContentScreen> createState() => _HomeContentScreenState();
}

class _HomeContentScreenState extends State<HomeContentScreen> {
  int activeIndex = 0;
  List<bool> isFavoriteList = [false, false];
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Color(0XFFF3E9B5),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Image.asset("assets/images/category/Snacks.png"),
                      ),
                      Text("Snacks"),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Color(0XFFF3E9B5),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Image.asset("assets/images/category/Meals.png"),
                      ),
                      Text("Meals"),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Color(0XFFF3E9B5),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Image.asset("assets/images/category/Vegan.png"),
                      ),
                      Text("Vegan"),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Color(0XFFF3E9B5),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Image.asset(
                          "assets/images/category/Desserts.png",
                        ),
                      ),
                      Text("Desserts"),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Color(0XFFF3E9B5),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Image.asset("assets/images/category/Drinks.png"),
                      ),
                      Text("Drinks"),
                    ],
                  ),
                ],
              ),
              Divider(color: Colors.orange, thickness: 1),
              Row(
                children: [
                  Text(
                    "Best Seller",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Merriweather',
                      color: Color(0XFF391713),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          "View All",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'LeagueSpartan',
                            color: Colors.orange,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 71.68,
                    height: 108,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            "assets/images/best_seller/bs1.png",
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 45,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                              child: Text(
                                "\$103.0",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 71.68,
                    height: 108,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            "assets/images/best_seller/bs2.png",
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 45,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                              child: Text(
                                "\$50.0",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 71.68,
                    height: 108,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            "assets/images/best_seller/bs3.png",
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 45,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                              child: Text(
                                "\$12.99",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 71.68,
                    height: 108,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            "assets/images/best_seller/bs4.png",
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 45,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Center(
                              child: Text(
                                "\$8.20",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              CarouselSlider(
                items: [
                  Container(
                    width: 323,
                    height: 182,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/general/slider_img.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 50,
                          left: 10,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Experience our \ndelicious new dish",
                                  style: TextStyle(
                                    fontFamily: 'LeagueSpartan',
                                    fontSize: 18,
                                  ),
                                ),
                                TextSpan(
                                  text: "\n30% OFF",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 323,
                    height: 182,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/general/slider_img.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 50,
                          left: 10,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Experience our \ndelicious new dish",
                                  style: TextStyle(
                                    fontFamily: 'LeagueSpartan',
                                    fontSize: 18,
                                  ),
                                ),
                                TextSpan(
                                  text: "\n30% OFF",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 323,
                    height: 182,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/general/slider_img.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 50,
                          left: 10,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Experience our \ndelicious new dish",
                                  style: TextStyle(
                                    fontFamily: 'LeagueSpartan',
                                    fontSize: 18,
                                  ),
                                ),
                                TextSpan(
                                  text: "\n30% OFF",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 323,
                    height: 182,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/general/slider_img.png",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 50,
                          left: 10,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Experience our \ndelicious new dish",
                                  style: TextStyle(
                                    fontFamily: 'LeagueSpartan',
                                    fontSize: 18,
                                  ),
                                ),
                                TextSpan(
                                  text: "\n30% OFF",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                carouselController: _controller,
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: activeIndex,
                  count: 4,
                  effect: ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: Colors.deepOrange,
                    dotColor: Colors.grey.shade300,
                    spacing: 5,
                  ),
                  onDotClicked: (index) => _controller.animateToPage(index),
                ),
              ),
              SizedBox(height: 25),
              Text(
                "Recommend",
                style: TextStyle(
                  color: Color(0XFF391713),
                  fontSize: 25,
                  fontFamily: 'LeagueSpartan',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(2, (index) {
                  return Container(
                    width: 159,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            index == 0
                                ? "assets/images/general/recommend1.png"
                                : "assets/images/general/recommend2.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isFavoriteList[index] =
                                      !isFavoriteList[index];
                                });
                              },
                              child: Icon(
                                isFavoriteList[index]
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
