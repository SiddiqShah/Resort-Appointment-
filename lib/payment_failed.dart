import 'package:flutter/material.dart';
import 'package:resort_appointment/add_card_screen.dart';

/// This screen is shown when a payment attempt fails.
/// It displays an image, failure message, and a "Try Again" button.
class PaymentFailed extends StatelessWidget {
  const PaymentFailed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Custom AppBar with a close (X) icon instead of back button
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false, // No default back button
        toolbarHeight: kToolbarHeight + 25.0, // Taller AppBar for spacing
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context); // Close the screen
            },
          ),
        ],
      ),

      // Main body content
      body: Padding(
        padding: const EdgeInsets.only(top: 90), // Push content down
        child: Center(
          child: Column(
            children: [
              // Display resort image with rounded corners
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'images/resort.jpeg',
                  height: 156,
                  width: 156,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 40),

              // Title: Payment failed
              const Text(
                'Payment failed',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              // Subtext: Explanation message
              const Text(
                'Your transaction has failed due to some\ntechnical error. Please try again.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),

              const SizedBox(height: 250),

              // Try Again button, navigates to AddCardScreen
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddCardScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 60,
                  width: 280,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Try Again',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
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
