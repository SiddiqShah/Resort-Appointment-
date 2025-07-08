import 'package:flutter/material.dart';
import 'package:resort_appointment/Appointment/appointment_screen.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Main content of the screen with padding from top
      body: Padding(
        padding: const EdgeInsets.only(top: 150),
        child: Center(
          child: Column(
            children: [
              // Image shown after payment success
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

              // Thank You message
              const Text(
                'Thank You!',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              // Description message
              const Text(
                'Your massage appointment has been\nscheduled. You can view details on the\nappointments screen.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),

              const SizedBox(height: 200),

              // Button to go to Appointments screen
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AppointmentScreen(),
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
                    'Go to Appointments',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Button for SPA centers list (currently shows a snackbar)
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('SPA centers list'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Container(
                  height: 60,
                  width: 280,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon for spa center list
                      Image.asset('images/Vector.png', height: 24, width: 24),
                      const SizedBox(width: 8),

                      // Button text
                      const Text(
                        'SPA centers list',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                        ),
                      ),
                    ],
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
