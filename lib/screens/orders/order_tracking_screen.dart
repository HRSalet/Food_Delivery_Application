import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'order_delivered_screen.dart';

class OrderTrackingScreen extends StatefulWidget {
  final DateTime orderDate;
  const OrderTrackingScreen({super.key, required this.orderDate});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  late ProgressData progressData;
  Timer? _timer;
  bool _navigated = false;
  @override
  void initState() {
    super.initState();
    progressData = ProgressData(initialProgress: 0.0);

    _timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      // Ensure the widget is still mounted and navigation hasn't occurred yet
      if (!mounted || _navigated) {
        timer.cancel();
        return;
      }

      if (progressData.progress >= 1.0) {
        timer.cancel();
        _navigated =
            true; // Set flag to true to indicate navigation has started
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => OrderDeliveredScreen(),
          ),
        );
      } else {
        progressData.progress += 0.02;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProgressData>.value(
      value: progressData,
      child: Scaffold(
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
            "Live Tracking",
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
            padding: EdgeInsets.only(top: 30, left: 30, right: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset("assets/images/general/map.png"),
                        ),
                      ),
                      Positioned.fill(
                        child: CustomPaint(painter: TrackingLinePainter()),
                      ),
                      Positioned(
                        top: 300,
                        left: 40,
                        child: Icon(
                          Icons.delivery_dining_outlined,
                          color: Colors.deepOrange,
                          size: 36,
                        ),
                      ),
                      Positioned(
                        top: 130,
                        right: 40,
                        child: Icon(
                          Icons.location_on_outlined,
                          color: Colors.deepOrange,
                          size: 36,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Expanded(
                          child: Column(
                            children: [
                              _buildActionButton(
                                icon: Icons.call,
                                label: "Call the delivery person",
                                onPressed: () {},
                              ),
                              SizedBox(height: 10),
                              _buildActionButton(
                                icon: Icons.message,
                                label: "Message the delivery boy",
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ProgressIndicatorWithIcon(),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Delivery goes to your way",
                              style: TextStyle(
                                fontFamily: 'LeagueSpartan',
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange,
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              DateFormat(
                                'd MMM yy, hh:mm a',
                              ).format(widget.orderDate).toString(),
                              style: TextStyle(
                                fontFamily: 'LeagueSpartan',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Pick up your delivery",
                              style: TextStyle(
                                fontFamily: 'LeagueSpartan',
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange,
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              DateFormat('d MMM yy, hh:mm a')
                                  .format(
                                    widget.orderDate.add(Duration(minutes: 30)),
                                  )
                                  .toString(),
                              style: TextStyle(
                                fontFamily: 'LeagueSpartan',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        fixedSize: const Size(173, 22),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      icon: Icon(icon, color: Colors.white),
      iconAlignment: IconAlignment.end,
      label: Text(label),
      onPressed: onPressed,
    );
  }
}

class TrackingLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.deepOrange
          ..strokeWidth = 3
          ..style = PaintingStyle.stroke;

    // Simulate 3-segmented line from delivery icon to pin icon
    final points = [
      Offset(size.width - 60, 150 + 18), // driver
      Offset(size.width - 100, 250),
      Offset(100, 400),
      Offset(40 + 18, size.height - 130), // destination pin
    ];

    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class ProgressData extends ChangeNotifier {
  double _progress;

  ProgressData({double initialProgress = 0.0})
    : _progress = initialProgress.clamp(0.0, 1.0);

  double get progress => _progress;

  set progress(double newValue) {
    final double clampedValue = newValue.clamp(0.0, 1.0);
    if (_progress != clampedValue) {
      _progress = clampedValue;
      notifyListeners();
    }
  }
}

class ProgressIndicatorWithIcon extends StatelessWidget {
  final double barHeight;
  final double iconContainerSize;
  final IconData iconData;
  final Color iconColor;
  final Color iconBorderColor;
  final double iconBorderWidth;

  const ProgressIndicatorWithIcon({
    super.key,
    this.barHeight = 24.0,
    this.iconContainerSize = 48.0,
    this.iconData = Icons.motorcycle_outlined,
    this.iconColor = const Color(0xFFE65100),
    this.iconBorderColor = const Color(0xFFE65100),
    this.iconBorderWidth = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double barWidth = 250.0;
        final double progress = Provider.of<ProgressData>(context).progress;
        final double iconLeft = (progress * barWidth) - (iconContainerSize / 2);

        return GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            final double newProgress = (details.localPosition.dx / barWidth)
                .clamp(0.0, 1.0);
            Provider.of<ProgressData>(context, listen: false).progress =
                newProgress;
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: barWidth,
                height: barHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(barHeight / 2),
                  gradient: const LinearGradient(
                    colors: <Color>[
                      Color(0xFFFF0000),
                      Color(0xFFFF7F00),
                      Color(0xFFFFFF00),
                      Color(0xFF9ACD32),
                      Color(0xFF008000),
                    ],
                    stops: <double>[0.0, 0.25, 0.5, 0.75, 1.0],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: iconLeft,
                top: (barHeight - iconContainerSize) / 2 - 8,
                child: Container(
                  width: iconContainerSize,
                  height: iconContainerSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                      color: iconBorderColor,
                      width: iconBorderWidth,
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      iconData,
                      color: iconColor,
                      size: iconContainerSize * 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
