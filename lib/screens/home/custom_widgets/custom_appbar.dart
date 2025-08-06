import 'package:flutter/material.dart';
class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppbar({
    super.key,
    this.onCartPressed,
    this.onNotificationPressed,
    this.onProfilePressed,
  });
  final VoidCallback? onCartPressed;
  final VoidCallback? onNotificationPressed;
  final VoidCallback? onProfilePressed;
  final TextEditingController _search = TextEditingController();

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  String _getQuote() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Rise and shine! It\'s breakfast time';
    } else if (hour < 17) {
      return 'Work\'s done, sun\'s high! It\'s lunch time';
    } else {
      return 'Day\'s end, stars bright! It\'s dinner time';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0xFFFFD166),
        padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Search bar
                  Expanded(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextField(
                              controller: _search,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search',
                              ),
                            ),
                          ),
                          // Filter button
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.tune, color: Colors.white),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  _roundIconButton(Icons.shopping_cart, onCartPressed),
                  const SizedBox(width: 8),
                  _roundIconButton(Icons.notifications, onNotificationPressed),
                  const SizedBox(width: 8),
                  _roundIconButton(Icons.person, onProfilePressed),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                _getGreeting(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                _getQuote(),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _roundIconButton(IconData icon, VoidCallback? onPressed) {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.orange),
        onPressed: onPressed,
        iconSize: 20,
        splashRadius: 22,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(160);
}
