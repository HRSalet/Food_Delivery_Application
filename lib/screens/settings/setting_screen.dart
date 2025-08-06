import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final List<bool> _notifSwitches = List.filled(6, false);
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'title': 'Notification Setting',
        'icon': Icons.notifications_none_rounded,
      },
      {'title': 'Password Setting', 'icon': Icons.lock_outline_rounded},
      {'title': 'Delete Account', 'icon': Icons.person_outline_outlined},
    ];

    return Scaffold(
      backgroundColor: const Color(0XFFF5CB58),
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.deepOrange,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Settings',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 25,
            color: Color(0XFFF8F8F8),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0XFFF5F5F5),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: items.length,
          itemBuilder:
              (context, index) => Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ExpansionTile(
                  leading: Icon(
                    items[index]['icon'] as IconData,
                    color: Colors.deepOrange,
                    size: 32,
                  ),
                  title: Text(items[index]['title'] as String),
                  childrenPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  children: switch (index) {
                    0 => List.generate(_notifSwitches.length, (i) {
                      const labels = [
                        'General Notification',
                        'Sound',
                        'Vibrate',
                        'Special Offers',
                        'Payments',
                        'Promo and Discounts',
                      ];
                      return SwitchListTile(
                        value: _notifSwitches[i],
                        activeColor: Colors.deepOrange,
                        title: Text(
                          labels[i],
                          style: const TextStyle(fontFamily: 'Inter'),
                        ),
                        onChanged:
                            (val) => setState(() => _notifSwitches[i] = val),
                      );
                    }),
                    1 => [
                      TextField(
                        controller: _currentPasswordController,
                        obscureText: _obscureCurrent,
                        decoration: InputDecoration(
                          labelText: 'Current Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureCurrent
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.deepOrange,
                            ),
                            onPressed:
                                () => setState(
                                  () => _obscureCurrent = !_obscureCurrent,
                                ),
                          ),
                          filled: true,
                          fillColor: Color(0XFFF3E9B5),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _passwordController,
                        obscureText: _obscureNew,
                        decoration: InputDecoration(
                          labelText: 'New Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureNew
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.deepOrange,
                            ),
                            onPressed:
                                () =>
                                    setState(() => _obscureNew = !_obscureNew),
                          ),
                          filled: true,
                          fillColor: Color(0XFFF3E9B5),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _confirmPasswordController,
                        obscureText: _obscureConfirm,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureConfirm
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.deepOrange,
                            ),
                            onPressed:
                                () => setState(
                                  () => _obscureConfirm = !_obscureConfirm,
                                ),
                          ),
                          filled: true,
                          fillColor: Color(0XFFF3E9B5),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                        ),
                        onPressed: () {
                          if (_passwordController.text.isEmpty ||
                              _confirmPasswordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please fill all the fields'),
                              ),
                            );
                          } else if (_passwordController.text.length < 8 ||
                              _confirmPasswordController.text.length < 8) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Password must be at least 8 characters long',
                                ),
                              ),
                            );
                          } else if (_passwordController.text !=
                              _confirmPasswordController.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Passwords do not match'),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Password updated successfully'),
                              ),
                            );
                          }
                        },
                        child: const Text('Update Password'),
                      ),
                    ],
                    2 => [
                      Text(
                        'All your data will be removed. This action is irreversible.',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.red.shade700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        icon: const Icon(
                          Icons.delete_forever_outlined,
                          color: Colors.white,
                        ),
                        label: const Text('Delete my account'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade600,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                    _ => [const SizedBox.shrink()],
                  },
                ),
              ),
        ),
      ),
    );
  }
}
