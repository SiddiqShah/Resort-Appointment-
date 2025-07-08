import 'package:flutter/material.dart';

// Main widget displaying resort details in a container
class ResortDetailContainer extends StatefulWidget {
  const ResortDetailContainer({super.key});

  @override
  State<ResortDetailContainer> createState() => _ResortDetailContainerState();
}

class _ResortDetailContainerState extends State<ResortDetailContainer> {
  // Controls whether to show all features or only the initial few
  bool _showMore = false;

  @override
  Widget build(BuildContext context) {
    // Full list of resort features
    final allFeatures = [
      'Wi-Fi',
      'Transfer',
      'Snack bar',
      'Parking',
      'Restaurant',
      'Spa',
      'Pool',
      'Laundry',
    ];

    // Show either all features or just the first 3 based on _showMore state
    final visibleFeatures = _showMore ? allFeatures : allFeatures.sublist(0, 3);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ------------------ Resort Info Row ------------------
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Resort image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    'images/resort.jpeg',
                    width: 85,
                    height: 85,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                // Resort name, price, and rating
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Weda Cita Resort and Spa by Mahaputra',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Text('From'),
                          const SizedBox(width: 6),
                          const Text(
                            r'$16/h',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 50),
                          // Rating badge
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffE47669),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 4.0,
                                horizontal: 8.0,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '4.9',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // ------------------ Feature Tags ------------------
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Display visible feature tags
                  ...visibleFeatures.map(
                    (feature) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: FeatureTag(label: feature),
                    ),
                  ),
                  // Show '...' to expand list
                  if (!_showMore)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _showMore = true;
                        });
                      },
                      child: const Text(
                        '...',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // ------------------ Show Less Button ------------------
            if (_showMore)
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _showMore = false;
                    });
                  },
                  child: const Text(
                    'Show less',
                    style: TextStyle(color: Color(0xffE47669)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ------------------ Reusable Feature Tag Widget ------------------
class FeatureTag extends StatelessWidget {
  final String label;

  const FeatureTag({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffE47669)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
        ),
      ),
    );
  }
}
