import 'package:flutter/material.dart';
import 'package:food_delivery_app/providers/address_provider.dart';
import 'package:food_delivery_app/screens/address/add_new_address.dart';
import 'package:provider/provider.dart';

import '../home/home_screen.dart';

class DeliveryAddress extends StatefulWidget {
  const DeliveryAddress({super.key});

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
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
          onPressed:
              () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Delivery Address',
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
        child: Consumer<AddressProvider>(
          builder: (context, provider, _) {
            final hasAddresses = provider.addresses.isNotEmpty;
            return hasAddresses
                ? buildAddress(provider)
                : Center(child: noAddressAvailable());
          },
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFDECF),
            foregroundColor: const Color(0xFFE95322),
            fixedSize: const Size.fromHeight(48),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AddNewAddress()),
            );
          },
          child: const Text(
            'Add New Address',
            style: TextStyle(fontSize: 16, fontFamily: 'LeagueSpartan'),
          ),
        ),
      ),
    );
  }

  Widget buildAddress(AddressProvider provider) {
    return Padding(
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
              itemCount: provider.addresses.length,
              itemBuilder: (context, index) {
                final a = provider.addresses[index];
                return InkWell(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: const Text('Delete Address'),
                            content: const Text(
                              'Are you sure you want to delete this address?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {
                                  provider.deleteAddress();
                                  Navigator.pop(context);
                                },
                                child: const Text("Delete"),
                              ),
                            ],
                          ),
                    );
                  },
                  child: RadioListTile<int>(
                    value: index,
                    groupValue: _selectedIndex,
                    onChanged: (v) => setState(() => _selectedIndex = v),
                    activeColor: Colors.deepOrange,
                    title: Text(
                      a.title,
                      style: const TextStyle(
                        fontFamily: 'LeagueSpartan',
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      a.address,
                      style: const TextStyle(fontFamily: 'LeagueSpartan'),
                    ),
                    secondary: Icon(a.iconData, color: Colors.deepOrange),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 4,
                    ),
                  ),
                );
              },
              separatorBuilder:
                  (_, __) =>
                      Divider(color: Colors.orange.shade400, thickness: .5),
            ),
          ),
        ],
      ),
    );
  }

  Widget noAddressAvailable() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.location_off_outlined,
          size: 100,
          color: Colors.deepOrange.shade200,
        ),
        SizedBox(height: 41),
        Text(
          "You don't have any saved delivery address please add new one.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'LeagueSpartan',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0XFFE95322),
          ),
        ),
      ],
    );
  }
}
