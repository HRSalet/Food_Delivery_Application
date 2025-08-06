import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';

class FoodDetailScreen extends StatefulWidget {
  final String foodName;
  final double foodPrice;
  final String foodImage;
  final String foodDescription;
  final String otherFoodDescription;
  const FoodDetailScreen({
    super.key,
    required this.foodName,
    required this.foodPrice,
    required this.foodImage,
    required this.foodDescription,
    required this.otherFoodDescription,
  });

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

enum Extra { water, lemonJuice, whiskey, wine }

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  Extra? _extra = Extra.water;
  int _quantity = 1;
  double _extraValue = 2.04;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5CB58),
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.deepOrange,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          widget.foodName,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 25,
            color: Color(0xFFF8F8F8),
          ),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          color: Color(0xFFF5F5F5),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Center(child: Image.asset(widget.foodImage)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${widget.foodPrice.toString()}",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.deepOrange,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (_quantity <= 1) {
                              setState(() {
                                _quantity = 1;
                              });
                            } else {
                              setState(() {
                                _quantity--;
                              });
                            }
                          },
                          icon: Icon(
                            Icons.remove_circle_outline,
                            color: Colors.deepOrange,
                          ),
                        ),
                        Text(
                          "$_quantity",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _quantity++;
                            });
                          },
                          icon: Icon(
                            Icons.add_circle_outline,
                            color: Colors.deepOrange,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(thickness: 0.5, color: Colors.deepOrange.shade300),
                Text(
                  widget.foodDescription,
                  style: TextStyle(fontFamily: 'LeagueSpartan', fontSize: 15),
                ),
                SizedBox(height: 5),
                Text(
                  widget.otherFoodDescription,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontFamily: 'LeagueSpartan', fontSize: 12),
                ),
                SizedBox(height: 30),
                Text(
                  "Extra",
                  style: TextStyle(fontFamily: 'LeagueSpartan', fontSize: 20),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RadioListTile<Extra>(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "Water",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'LeagueSpartan',
                        ),
                      ),
                      value: Extra.water,
                      groupValue: _extra,
                      onChanged: (Extra? value) {
                        setState(() {
                          _extra = value;
                        });
                        _extraValue = 2.04;
                      },
                      activeColor: Colors.deepOrange,
                      secondary: Text(
                        "\$2.04",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'LeagueSpartan',
                        ),
                      ),
                    ),
                    RadioListTile<Extra>(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "Lemon Juice",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'LeagueSpartan',
                        ),
                      ),
                      value: Extra.lemonJuice,
                      groupValue: _extra,
                      onChanged: (Extra? value) {
                        setState(() {
                          _extra = value;
                          _extraValue = 4.99;
                        });
                      },
                      activeColor: Colors.deepOrange,
                      secondary: Text(
                        "\$4.99",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'LeagueSpartan',
                        ),
                      ),
                    ),
                    RadioListTile<Extra>(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "Whiskey",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'LeagueSpartan',
                        ),
                      ),
                      value: Extra.whiskey,
                      groupValue: _extra,
                      onChanged: (Extra? value) {
                        setState(() {
                          _extra = value;
                          _extraValue = 17.99;
                        });
                      },
                      activeColor: Colors.deepOrange,
                      secondary: Text(
                        "\$17.99",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'LeagueSpartan',
                        ),
                      ),
                    ),
                    RadioListTile<Extra>(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "Red Wine",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'LeagueSpartan',
                        ),
                      ),
                      value: Extra.wine,
                      groupValue: _extra,
                      onChanged: (Extra? value) {
                        setState(() {
                          _extra = value;
                          _extraValue = 3.99;
                        });
                      },
                      activeColor: Colors.deepOrange,
                      secondary: Text(
                        "\$3.99",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'LeagueSpartan',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      fixedSize: Size(175, 33),
                    ),
                    onPressed: () {
                      final newItem = CartModel(
                        productImage: widget.foodImage,
                        productPrice: widget.foodPrice,
                        productQuantity: _quantity,
                        orderDateTime: DateTime.now(),
                        productName: widget.foodName,
                        subTotal: widget.foodPrice + _extraValue,
                        taxFees: 5.00,
                        deliveryFees: 3.00,
                        total: widget.foodPrice + _extraValue + 5.00 + 3.00,
                      );

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Provider.of<CartProvider>(
                          context,
                          listen: false,
                        ).addToCart(newItem);

                        Navigator.pop(context);
                      });
                    },

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.shopping_cart_outlined, color: Colors.white),
                        Text("Add to Cart"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
