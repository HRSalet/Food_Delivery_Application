import 'package:flutter/material.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  final List<Map<String, dynamic>> questions = [
    {
      'que': 'How do I place an order?',
      'ans':
          'After setting your delivery address, browse and add items to your cart, and proceed to checkout. Confirm your order details and select your preferred payment method.',
    },
    {
      'que': 'What payment methods do you accept?',
      'ans':
          'We accept various payment methods, including credit/debit cards, and popular digital wallets like Google Pay and Paytm. Cash on Delivery also available.',
    },
    {
      'que': 'How can I contact customer support?',
      'ans':
          'If you need assistance, you can contact our customer support team directly through the apps Help or Support section.',
    },
    {
      'que': 'What if I want to cancel my order?',
      'ans':
          'If you need to cancel an order, you can easily cancel your order but you have to cancel your within 10 mins. Cancellations may not be possible once the food has been prepared.',
    },
    {
      'que': 'How do I track my order?',
      'ans':
          'Once your order is placed, you receive real-time updates through the app. You can track its status from preparation to delivery, and often see the delivery person location on a map.',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF5CB58),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(color: Color(0XFFF5F5F5)),
        child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ExpansionTile(
                title: Text(questions[index]['que']),
                childrenPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      questions[index]['ans'],
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
