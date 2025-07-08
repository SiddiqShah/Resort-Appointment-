import 'package:flutter/material.dart';
import 'package:resort_appointment/add_card_screen.dart';
import 'package:resort_appointment/Appointment/appointment_screen.dart';

/// This screen represents a filled payment screen with a dummy card ("MasterCard") and a done button.
class PaymentFill extends StatefulWidget {
  const PaymentFill({super.key});

  @override
  State<PaymentFill> createState() => _PaymentFillState();
}

class _PaymentFillState extends State<PaymentFill> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Light gray background
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leadingWidth: 40,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(), // Go back
        ),
        titleSpacing: 0,
        title: const Text(
          'Payment',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
        ),
      ),

      // Main body content
      body: Column(
        children: [
          // White card container with 'Add payment method' section
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
                  // Add icon inside a circle
                  Padding(
                    padding: const EdgeInsets.only(top: 32, bottom: 16),
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to AddCardScreen on tap
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

                  // Add payment method button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: GestureDetector(
                      onTap: () {
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

          const SizedBox(height: 10),

          // Pre-filled dummy MasterCard info
          MasterCard(),

          Divider(),
        ],
      ),

      // Bottom "Done" button
      bottomNavigationBar: const ConfirmAndPay(),
    );
  }
}

/// Bottom navigation widget with "Done" button that navigates to AppointmentScreen
class ConfirmAndPay extends StatelessWidget {
  const ConfirmAndPay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AppointmentScreen(),
                  ),
                );
              },
              child: Container(
                width: 350,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
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

/// Displays a sample MasterCard entry with masked card number
Widget MasterCard() {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Card type title
        Text(
          'MasterCard',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 15),

        // Row with masked card number and right-side info
        Row(
          children: [
            // Masked card number
            Text(
              '•••• 5678',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Spacer(),

            // Card status and arrow
            Row(
              children: [
                Text(
                  'Main Method',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 15),
                Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
