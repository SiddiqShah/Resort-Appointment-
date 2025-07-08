import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resort_appointment/payment_fill.dart';

/// Screen to add a payment card (credit/debit) with input fields and validation.
class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  bool isMainMethod = true; // Toggle for marking card as default method

  // Controllers for text input fields
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  /// Validate form fields: card number = 19 chars (includes spaces),
  /// exp = 5 chars (MM/YY), CVV = 3 or 4 digits
  bool get isFormValid =>
      cardNumberController.text.trim().length == 19 &&
      expController.text.trim().length == 5 &&
      (cvvController.text.trim().length == 3 ||
          cvvController.text.trim().length == 4);

  @override
  void initState() {
    super.initState();

    // Format Card Number: Add space after every 4 digits
    cardNumberController.addListener(() {
      String text = cardNumberController.text.replaceAll(' ', '');
      if (text.length > 16) text = text.substring(0, 16);

      final newText = StringBuffer();
      for (int i = 0; i < text.length; i++) {
        newText.write(text[i]);
        if ((i + 1) % 4 == 0 && i != text.length - 1) {
          newText.write(' ');
        }
      }

      final formatted = newText.toString();
      if (formatted != cardNumberController.text) {
        final cursorPos = formatted.length;
        cardNumberController.value = TextEditingValue(
          text: formatted,
          selection: TextSelection.collapsed(offset: cursorPos),
        );
      }

      _onFormChanged(); // Refresh form state
    });

    // Format Expiry Date: Add '/' after 2 digits (MM/YY)
    expController.addListener(() {
      String text = expController.text.replaceAll('/', '');
      if (text.length > 4) text = text.substring(0, 4);

      if (text.length >= 2) {
        text = '${text.substring(0, 2)}/${text.substring(2)}';
      }

      if (text != expController.text) {
        expController.value = TextEditingValue(
          text: text,
          selection: TextSelection.collapsed(offset: text.length),
        );
      }

      _onFormChanged();
    });

    // Limit CVV to max 4 digits
    cvvController.addListener(() {
      if (cvvController.text.length > 4) {
        cvvController.text = cvvController.text.substring(0, 4);
        cvvController.selection = TextSelection.collapsed(offset: 4);
      }

      _onFormChanged();
    });
  }

  /// Update form state to re-render button status
  void _onFormChanged() => setState(() {});

  @override
  void dispose() {
    cardNumberController.dispose();
    expController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // AppBar with close icon and title
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          'Add a card',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),

      // Body with input fields and toggle
      body: Column(
        children: [
          const SizedBox(height: 16),

          // Input form
          Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                const CardDetails(
                  titletxt: 'Name on card',
                  hintText: 'Enter name on card',
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 12),

                // Card Number input
                CardDetails(
                  titletxt: 'Card Number',
                  hintText: '0000 0000 0000 0000',
                  controller: cardNumberController,
                  keyboardType: TextInputType.number,
                  isCardNumber: true,
                ),
                const SizedBox(height: 4),

                // Expiry and CVV in a row
                Row(
                  children: [
                    Expanded(
                      child: CardDetails(
                        titletxt: 'Exp. MM/YY',
                        hintText: 'MM/YY',
                        controller: expController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CardDetails(
                        titletxt: 'CVV',
                        hintText: '',
                        controller: cvvController,
                        keyboardType: TextInputType.number,
                        isObscure: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          // Toggle for "Main method"
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Main method',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Row(
                  children: [
                    const Text('active', style: TextStyle(color: Colors.grey)),
                    const SizedBox(width: 8),
                    Switch(
                      activeColor: Colors.white,
                      activeTrackColor: Colors.blue,
                      inactiveTrackColor: Colors.grey[400],
                      value: isMainMethod,
                      onChanged: (value) =>
                          setState(() => isMainMethod = value),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

      // Bottom button: Add Card
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 44),
        child: GestureDetector(
          onTap: isFormValid
              ? () {
                  // Currently routes to PaymentFailed (can be changed later)
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const PaymentFill(),
                    ),
                  );
                }
              : null,
          child: Container(
            width: 350,
            height: 60,
            decoration: BoxDecoration(
              color: isFormValid ? Colors.blue : const Color(0xfff7f7f7),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Text(
                'Add card',
                style: TextStyle(
                  color: isFormValid ? Colors.white : const Color(0xffbdbdbd),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Reusable widget to show input fields with optional formatting, obscuring, etc.
class CardDetails extends StatefulWidget {
  final String titletxt, hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool isCardNumber; // If true, show visibility toggle
  final bool isObscure; // If true, hide input (like for CVV)

  const CardDetails({
    super.key,
    required this.titletxt,
    required this.hintText,
    this.controller,
    this.keyboardType,
    this.isCardNumber = false,
    this.isObscure = false,
  });

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  bool _obscureText = true; // For toggle visibility icon

  @override
  Widget build(BuildContext context) {
    final isCardNumber = widget.isCardNumber;
    final isObscure = widget.isObscure;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.titletxt, style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 4),

          SizedBox(
            height: 48,
            child: TextFormField(
              controller: widget.controller,
              cursorColor: Colors.black,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),

              // Hide input if needed
              obscureText: isCardNumber
                  ? _obscureText
                  : isObscure
                  ? true
                  : false,

              keyboardType: widget.keyboardType ?? TextInputType.text,

              // For CVV: digits only, max 4
              inputFormatters: widget.titletxt == 'CVV'
                  ? [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ]
                  : [],

              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: Color(0xFFBDBDBD),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black),
                ),

                // Eye icon for Card Number field
                suffixIcon: isCardNumber
                    ? IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () =>
                            setState(() => _obscureText = !_obscureText),
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
