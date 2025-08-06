import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderDetailScreen extends StatefulWidget {
  final dynamic orderNo;
  final DateTime orderDateTime;
  const OrderDetailScreen({
    super.key,
    required this.orderNo,
    required this.orderDateTime,
  });

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  final List<Map<String, dynamic>> _orderItems = [
    {
      'name': 'Strawberry Shake',
      'price': 10.99,
      'date': DateTime.now(),
      'img': 'assets/images/general/order_again1.png',
      'qty': 2,
    },
    {
      'name': 'Broccoli Lasagna',
      'price': 29.99,
      'date': DateTime.now(),
      'img': 'assets/images/general/order_again2.png',
      'qty': 3,
    },
  ];
  double get subtotal {
    return _orderItems.fold(
      0,
      (sum, item) => sum + item['price'] * item['qty'],
    );
  }

  double taxFees = 5;
  double deliveryFees = 5;

  double get total => subtotal + taxFees + deliveryFees;

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
        title: Text(
          "Order Details",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 25,
            color: Color(0XFFF8F8F8),
          ),
        ),
        centerTitle: true,
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
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(
                "Order No. ${widget.orderNo}",
                style: TextStyle(
                  fontFamily: 'LeagueSpartan',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(DateFormat('d MMM, hh:mm a').format(widget.orderDateTime)),
              SizedBox(height: 15),
              Divider(thickness: 0.5, color: Colors.deepOrange),
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(_orderItems[index]['img']),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _orderItems[index]['name'],
                              style: TextStyle(
                                color: Color(0XFF391713),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'LeagueSpartan',
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("\$${_orderItems[index]['price']}"),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              DateFormat(
                                'd MMM, hh:mm a',
                              ).format(_orderItems[index]['date']),
                              style: const TextStyle(
                                color: Color(0XFF391713),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'LeagueSpartan',
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Quantity: ${_orderItems[index]['qty']}",
                              style: TextStyle(color: Color(0XFF391713)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(thickness: 0.5, color: Colors.deepOrange);
                },
                itemCount: _orderItems.length,
              ),
              ListTile(
                leading: Text(
                  "Subtotal",
                  style: TextStyle(
                    color: Color(0XFF391713),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'LeagueSpartan',
                  ),
                ),
                trailing: Text(
                  "\$${subtotal.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Color(0XFF391713),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'LeagueSpartan',
                  ),
                ),
              ),
              ListTile(
                leading: Text(
                  "Tax and Fees",
                  style: TextStyle(
                    color: Color(0XFF391713),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'LeagueSpartan',
                  ),
                ),
                trailing: Text(
                  "\$${taxFees.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Color(0XFF391713),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'LeagueSpartan',
                  ),
                ),
              ),
              ListTile(
                leading: Text(
                  "Delivery",
                  style: TextStyle(
                    color: Color(0XFF391713),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'LeagueSpartan',
                  ),
                ),
                trailing: Text(
                  "\$${deliveryFees.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Color(0XFF391713),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'LeagueSpartan',
                  ),
                ),
              ),
              Divider(thickness: 0.5, color: Colors.deepOrange),
              ListTile(
                leading: Text(
                  "Total",
                  style: TextStyle(
                    color: Color(0XFF391713),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'LeagueSpartan',
                  ),
                ),
                trailing: Text(
                  "\$${total.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Color(0XFF391713),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'LeagueSpartan',
                  ),
                ),
              ),
              SizedBox(height: 5),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 3),
                        content: Text(
                          "Your order has been successfully submitted.",
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0XFFFFDECF),
                    fixedSize: Size(120, 26),
                  ),
                  child: Text(
                    "Order Again",
                    style: TextStyle(
                      fontFamily: 'LeagueSpartan',
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
