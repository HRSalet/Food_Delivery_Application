import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/home/home_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF5CB58),
      appBar: AppBar(
        toolbarHeight: 100.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.deepOrange,
          ),
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          "My Profile",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 25,
            color: Color(0XFFF8F8F8),
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(
            child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: Color(0XFFF5F5F5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset("assets/images/general/profile.png"),
                      Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Full Name",
                              style: TextStyle(
                                fontFamily: 'LeagueSpartan',
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              controller: _nameController,
                              keyboardType: TextInputType.text,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a valid name';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'enter your name',
                                hintStyle: TextStyle(
                                  fontFamily: 'LeagueSpartan',
                                  fontSize: 15,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                fillColor: Color(0XFFF3E9B5),
                                filled: true,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Date of Birth",
                              style: TextStyle(
                                fontFamily: 'LeagueSpartan',
                                fontSize: 20,
                              ),
                            ),
                            TextFormField(
                              controller: _dobController,
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: 'Date of Birth',
                                hintStyle: const TextStyle(
                                  fontFamily: 'LeagueSpartan',
                                  fontSize: 15,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                fillColor: const Color(0XFFF3E9B5),
                                filled: true,
                                suffixIcon: const Icon(
                                  Icons.calendar_month,
                                ), // optional
                              ),
                              onTap: () async {
                                // Close the keyboard if it happened to open
                                FocusScope.of(
                                  context,
                                ).requestFocus(FocusNode());
                                final DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now().subtract(
                                    const Duration(days: 365 * 18),
                                  ), // default = 18 y ago
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                  helpText: 'Select your date of birth',
                                );
                                if (picked != null) {
                                  // Format date however you like; here we use dd‑MM‑yyyy
                                  final formatted =
                                      "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
                                  setState(
                                    () => _dobController.text = formatted,
                                  );
                                }
                              },
                              validator:
                                  (value) =>
                                      (value == null || value.isEmpty)
                                          ? 'Please pick your date of birth'
                                          : null,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Email",
                              style: TextStyle(
                                fontFamily: 'LeagueSpartan',
                                fontSize: 20,
                              ),
                            ),
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a valid email';
                                }
                                if (!value.contains('@') ||
                                    !value.contains('.')) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'example@gmail.com',
                                hintStyle: TextStyle(
                                  fontFamily: 'LeagueSpartan',
                                  fontSize: 15,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                fillColor: Color(0XFFF3E9B5),
                                filled: true,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Mobile Number",
                              style: TextStyle(
                                fontFamily: 'LeagueSpartan',
                                fontSize: 20,
                              ),
                            ),
                            TextFormField(
                              controller: _mobileController,
                              keyboardType: TextInputType.number,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Mobile number can't be empty";
                                }
                                if (value.length < 10) {
                                  return 'Please enter a valid mobile number';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: '+91 1234567890',
                                hintStyle: TextStyle(
                                  fontFamily: 'LeagueSpartan',
                                  fontSize: 15,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                fillColor: Color(0XFFF3E9B5),
                                filled: true,
                              ),
                            ),
                            SizedBox(height: 35),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Profile updated"),
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0XFFE95322),
                                  foregroundColor: Color(0XFFFFFFFF),
                                  fixedSize: Size(140, 36),
                                  visualDensity: VisualDensity.comfortable,
                                ),
                                child: Text(
                                  "Update Profile",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'LeagueSpartan',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
