import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery_app/screens/home/home_screen.dart';
import 'package:food_delivery_app/screens/payment/add_new_card.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final List<Map<String, dynamic>> paymentMethods = [
    {'name': 'Credit Card', 'icon': Icons.credit_card},
    {'name': 'Google Pay', 'icon': FontAwesomeIcons.googlePay},
    {'name': 'PayPal', 'icon': Icons.paypal_outlined},
    {'name': 'Amazon Pay', 'icon': FontAwesomeIcons.amazonPay},
    {'name': 'Cash on Delivery', 'icon': Icons.payments_outlined},
  ];
  int? _selectedIndex = 0;
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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Payment Methods',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 25,
            color: Color(0xFFF8F8F8),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF5F5F5),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 100,
                    left: 16,
                    right: 16,
                  ),
                  itemBuilder: (count, index) {
                    return RadioListTile(
                      value: index,
                      groupValue: _selectedIndex,
                      onChanged: (v) => setState(() => _selectedIndex = v),
                      activeColor: Colors.deepOrange,
                      title: Text(
                        paymentMethods[index]['name'].toString(),
                        style: const TextStyle(
                          fontFamily: 'LeagueSpartan',
                          fontSize: 18,
                        ),
                      ),
                      secondary: Icon(
                        paymentMethods[index]['icon'],
                        color: Colors.deepOrange,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 4,
                      ),
                    );
                  },
                  separatorBuilder:
                      (_, __) =>
                          Divider(color: Colors.orange.shade400, thickness: .5),
                  itemCount: paymentMethods.length,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              label: Text(
                'Place Order',
                style: TextStyle(fontSize: 16, fontFamily: 'LeagueSpartan'),
              ),
              onPressed: () {
                final selectedPayment =
                    paymentMethods[_selectedIndex ?? 0]['name'];
                showDialog(
                  context: context,
                  builder:
                      (_) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        title: Text("Order Placed!"),
                        content: Text("Payment Method: $selectedPayment"),
                        actions: [
                          TextButton(
                            child: Text("Continue"),
                            onPressed: () {
                              Navigator.pop(context); // Close dialog
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => HomeScreen()),
                              );
                              Provider.of<CartProvider>(
                                context,
                                listen: false,
                              ).clearCart();
                            },
                          ),
                        ],
                      ),
                );
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFDECF),
                foregroundColor: const Color(0xFFE95322),
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AddNewCard()),
                );
              },
              child: const Text(
                'Add New Card',
                style: TextStyle(fontSize: 16, fontFamily: 'LeagueSpartan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
