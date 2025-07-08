import 'package:flutter/material.dart';
import 'package:resort_appointment/Appointment/apointment_info.dart';
import 'package:resort_appointment/Appointment/resort_detail_container.dart';
import 'package:resort_appointment/payment_success.dart';

/// Main Appointment screen widget
class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background color of the screen
      backgroundColor: const Color.fromARGB(255, 234, 234, 234),

      // App bar with title
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 234, 234, 234),
        title: const Text(
          'Appointment',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
        ),
        titleSpacing: 0,
      ),

      // Body content with scroll support
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Resort Details Card
            const ResortDetailContainer(),

            // Payment method display
            masterCard(),

            // Appointment details section
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Appointment Details',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            // Appointment info widgets
            AppointmentInfo(
              leadingText: '2 Sessions',
              trailingText: 'sessions',
              icon: Icons.arrow_forward_ios,
            ),
            Divider(),
            AppointmentInfo(
              leadingText: 'Tomorrow, July 3rd',
              trailingText: '5:30 PM',
              icon: Icons.arrow_forward_ios,
            ),
            Divider(),
            AppointmentInfo(
              leadingText: 'Doesnt matter',
              trailingText: 'special sex',
              icon: Icons.arrow_forward_ios,
            ),
            Divider(),
            AppointmentInfo(
              leadingText: 'London, DC',
              trailingText: 'address',
              icon: Icons.error_outline_outlined,
            ),

            // Personal Info section
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Personal Info',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            AppointmentInfo(
              leadingText: 'Therapist',
              trailingText: 'message type',
              icon: Icons.arrow_forward_ios,
            ),
            Divider(),
            AppointmentInfo(
              leadingText: 'Inscreased muscle tone',
              trailingText: 'indications',
              icon: Icons.arrow_forward_ios,
            ),
            Divider(),
            AppointmentInfo(
              leadingText: 'Lakki Marwat',
              trailingText: 'area',
              icon: Icons.arrow_forward_ios,
            ),
          ],
        ),
      ),

      // Bottom confirm button
      bottomNavigationBar: GestureDetector(
        onTap: () {
          // Navigate to success screen on tap
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PaymentSuccess()),
          );
        },
        child: confirm(),
      ),
    );
  }
}

/// Widget displaying a mock MasterCard payment method
Widget masterCard() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'MasterCard',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: const [
              Icon(Icons.credit_card, color: Colors.black),
              SizedBox(width: 8),
              Text(
                '•••• 5678',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              Spacer(),
              Text(
                '04/28',
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

/// Widget for the bottom confirmation section
Widget confirm() {
  return Container(
    width: double.infinity,
    height: 112,
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            // Price label
            const Text(
              r'$32',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 15),

            // Confirm button
            Container(
              width: 271,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
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
