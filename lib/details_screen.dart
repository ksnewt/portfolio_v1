import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  // Defining variables that the screen needs to recieve
  final String productName;
  final double productPrice;

  // Add them to the "Constuctor" (Envelope)
  const DetailsScreen({
    super.key,
    required this.productName,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text((productName)),
      body: const Center(
        child: Column()
          'Detailed View of Headphones\n\nBluetooth 6.0 | 40hr Battery',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
