import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  late int _orderNumber;
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _orderNumber = _generateOrderNo();
  }

  int _generateOrderNo() {
    Random random = Random();
    return 1000000 + random.nextInt(9000000);
  }

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
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Support',
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
          padding: const EdgeInsets.all(20),
          child: ListView(
            padding: const EdgeInsets.only(bottom: 120),
            children: [
              _buildUserBubble("Hello!", "09:00"),
              const SizedBox(height: 10),
              _buildBotBubble(
                "Hello!, please choose the number corresponding to your needs for a more efficient service.",
              ),
              const SizedBox(height: 10),
              _buildBotBubble(
                "1. Order Management\n2. Payment Management\n3. Account management and profile\n4. About order tracking\n5. Safety",
              ),
              _buildTimeText("09:00"),
              const SizedBox(height: 10),
              _buildUserBubble("1", "09:03"),
              const SizedBox(height: 10),
              _buildBotOrderDetails(),
            ],
          ),
        ),
      ),
      bottomSheet: _buildBottomBar(),
    );
  }

  Widget _buildUserBubble(String message, String time) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0XFFF3E9B5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            message,
            style: const TextStyle(
              fontFamily: 'LeagueSpartan',
              fontSize: 17,
              color: Colors.black54,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(time, style: const TextStyle(fontFamily: 'LeagueSpartan')),
      ],
    );
  }

  Widget _buildBotBubble(String message) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0XFFF5F5F5),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.deepOrange.shade500, width: 1),
      ),
      child: Text(
        message,
        style: const TextStyle(
          fontFamily: 'LeagueSpartan',
          color: Colors.black54,
        ),
      ),
    );
  }

  Widget _buildTimeText(String time) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 8),
      child: Text(time, style: const TextStyle(fontFamily: 'LeagueSpartan')),
    );
  }

  Widget _buildBotOrderDetails() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0XFFF5F5F5),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.deepOrange.shade500, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "You have current order \nStrawberry Shake and Broccoli Lasagna.",
          ),
          const SizedBox(height: 5),
          Text(
            "Order No. $_orderNumber",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(
            DateFormat('d MMM, hh:mm a').format(DateTime.now()),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(120, 25.09),
                  foregroundColor: Colors.deepOrange,
                  backgroundColor: const Color(0XFFFFDECF),
                ),
                child: const Text("Order Issues", textAlign: TextAlign.center),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(140, 25.09),
                  foregroundColor: Colors.deepOrange,
                  backgroundColor: const Color(0XFFFFDECF),
                ),
                child: const Text(
                  "Order not received",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 100,
      decoration: const BoxDecoration(color: Color(0XFFFFDECF)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _iconBox(Icons.attach_file),
          Expanded(
            child: Container(
              height: 35,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: const Color(0XFFF5F5F5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: _messageController,
                decoration: const InputDecoration(
                  hintText: "Write a message...",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          _iconBox(Icons.mic_none_rounded),
          _iconBox(Icons.send_rounded, size: 20),
        ],
      ),
    );
  }

  Widget _iconBox(IconData icon, {double size = 24}) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: const Color(0XFFF5F5F5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(icon, color: Colors.deepOrange, size: size),
    );
  }
}
