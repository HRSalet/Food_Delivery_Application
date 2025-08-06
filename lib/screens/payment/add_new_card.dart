import 'package:flutter/material.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({super.key});

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  final TextEditingController _cardHolderName = TextEditingController();
  final TextEditingController _cardNumber = TextEditingController();
  final TextEditingController _expiryDate = TextEditingController();
  final TextEditingController _cvv = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _cardHolderName.dispose();
    _cardNumber.dispose();
    _expiryDate.dispose();
    _cvv.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          'Add Card',
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
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight, // 👈 fills the full height
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 40, 40, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/general/credit_card.png"),
                        const SizedBox(height: 20),
                        const Text(
                          "Card holder name",
                          style: TextStyle(
                            fontFamily: 'LeagueSpartan',
                            fontSize: 18,
                          ),
                        ),
                        TextField(
                          controller: _cardHolderName,
                          keyboardType: TextInputType.name,
                          decoration: _inputDecoration(
                            "Enter card holder name",
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Card number",
                          style: TextStyle(
                            fontFamily: 'LeagueSpartan',
                            fontSize: 18,
                          ),
                        ),
                        TextField(
                          controller: _cardNumber,
                          keyboardType: TextInputType.number,
                          decoration: _inputDecoration("Enter card number"),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(child: _buildExpiryField()),
                            const SizedBox(width: 40),
                            Expanded(child: _buildCvvField()),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: _saveCard,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text("Save Card"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey.shade900),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      filled: true,
      fillColor: Colors.orange.shade50,
      contentPadding: const EdgeInsets.all(15),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.orange),
      ),
    );
  }

  Widget _buildExpiryField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Expiry date",
          style: TextStyle(fontFamily: 'LeagueSpartan', fontSize: 18),
        ),
        TextFormField(
          controller: _expiryDate,
          readOnly: true,
          onTap: _pickExpiryDate,
          decoration: _inputDecoration(
            'Expiry date',
          ).copyWith(suffixIcon: const Icon(Icons.calendar_month)),
        ),
      ],
    );
  }

  Widget _buildCvvField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "CVV",
          style: TextStyle(fontFamily: 'LeagueSpartan', fontSize: 18),
        ),
        TextField(
          controller: _cvv,
          keyboardType: TextInputType.number,
          decoration: _inputDecoration("Enter cvv"),
        ),
      ],
    );
  }

  void _pickExpiryDate() async {
    FocusScope.of(context).unfocus();
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
      helpText: 'Select card expiry date',
    );
    if (picked != null) {
      final formatted =
          "${picked.month.toString().padLeft(2, '0')}/${picked.year}";
      setState(() => _expiryDate.text = formatted);
    }
  }

  void _saveCard() {
    final cardHolderName = _cardHolderName.text.trim();
    final cardNumber = _cardNumber.text.trim();
    final expiryDate = _expiryDate.text.trim();
    final cvv = _cvv.text.trim();
    if ([cardHolderName, cardNumber, expiryDate, cvv].any((e) => e.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all the fields")),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Credit card added successfully")),
    );
    Navigator.pop(context);
  }
}
