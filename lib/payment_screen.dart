import 'package:flutter/material.dart';
import 'package:resort_appointment/add_card_screen.dart';

/// This screen displays the Payment UI where user can add a payment method.
class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Light grey background
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leadingWidth: 40,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.of(context).pop(), // Go back to previous screen
        ),
        titleSpacing: 0,
        title: const Text(
          'Payment',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
        ),
      ),

      // Main body of the screen
      body: Column(
        children: [
          // Card container with padding and decoration
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  // Circular Add Icon button
                  Padding(
                    padding: const EdgeInsets.only(top: 32, bottom: 16),
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to Add Card Screen when tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddCardScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.orange.shade200,
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            size: 32,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // "Add payment method" button below the circular icon
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: GestureDetector(
                      onTap: () {
                        // Same action: go to AddCardScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddCardScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 319,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Color(0xfff7f7f7),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: const Center(
                          child: Text(
                            'Add payment method',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),

      // Bottom fixed button section
      bottomNavigationBar: ConfirmAndPay(),
    );
  }
}

/// Bottom bar widget with "Confirm and Pay" button
Widget ConfirmAndPay() {
  return Container(
    width: double.infinity,
    height: 112,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          child: Container(
            width: 350,
            height: 60,
            decoration: BoxDecoration(
              color: Color(0xfff7f7f7),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Text(
                'Confirm and Pay',
                style: TextStyle(
                  color: Color(0xffbdbdbd),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
