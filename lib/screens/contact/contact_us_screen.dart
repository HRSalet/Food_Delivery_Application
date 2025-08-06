import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final List<Map<String, dynamic>> contactOptions = [
    {
      'name': 'Customer Service',
      'icon': Icons.headset_outlined,
      'detail': '☎  +91‑98765‑43210', // or use `tel:` URL
      'url': 'tel:+919876543210',
    },
    {
      'name': 'Website',
      'icon': CupertinoIcons.globe,
      'detail': 'https://www.example.com',
      'url': 'https://www.example.com',
    },
    {
      'name': 'WhatsApp',
      'icon': FontAwesomeIcons.whatsapp,
      'detail': '+91‑98765‑43210',
      'url': 'https://wa.me/919876543210',
    },
    {
      'name': 'Facebook',
      'icon': FontAwesomeIcons.facebook,
      'detail': '/examplepage',
      'url': 'https://facebook.com/examplepage',
    },
    {
      'name': 'Instagram',
      'icon': FontAwesomeIcons.instagram,
      'detail': '@exampleprofile',
      'url': 'https://instagram.com/exampleprofile',
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
          itemCount: contactOptions.length,
          itemBuilder: (context, index) {
            final option = contactOptions[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ExpansionTile(
                leading: Icon(option['icon'], color: Colors.deepOrange),
                title: Text(
                  option['name'],
                  style: const TextStyle(fontFamily: 'LeagueSpartan'),
                ),
                iconColor: Colors.deepOrange,
                collapsedIconColor: Colors.deepOrange,
                childrenPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          option['detail'],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.open_in_new),
                        label: const Text('Open'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.deepOrange,
                        ),
                      ),
                    ],
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
