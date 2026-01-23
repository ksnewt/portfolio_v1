import 'package:flutter/material.dart';
import 'details_screen.dart';

void main() => runApp(const MyProfileApp());

class MyProfileApp extends StatefulWidget {
  const MyProfileApp({super.key});

  @override
  State<MyProfileApp> createState() => _MyProfileAppState();
}

class _MyProfileAppState extends State<MyProfileApp> {
  // --- STATE VARIABLES (Logic) ---
  int cartCount = 0;
  double totalPrice = 0.0;
  final double headphonePrice =
      199.99; // Using a variable instead of hard-coding 299.99

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[800], // Background color
        body: SafeArea(
          child: Builder(
            builder: (BuildContext context) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // New: The Status Display
                    Text(
                      'Cart: $cartCount items | Total: \$${totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // 1. The Avatar (A Container box)
                    const CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.shopping_bag,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),

                    // 2. The Name (Text widget)
                    const Text(
                      'Pro Wireless Headphones',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // 3. The Subtitle (Now using our variable)
                    Text(
                      '\$$headphonePrice',
                      style: TextStyle(
                        color: Colors.blue.shade100,
                        fontSize: 20.0,
                        letterSpacing: 2.5,
                      ),
                    ),

                    // 4. A Divider (Like a <hr> in HTML)
                    const SizedBox(
                      height: 20,
                      width: 150,
                      child: Divider(color: Color.fromARGB(255, 168, 168, 28)),
                    ),

                    // 5. The "Action" Buttons (Add & Details)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              cartCount++;
                              totalPrice += headphonePrice;
                            });
                          },
                          icon: const Icon(Icons.shopping_cart, size: 18),
                          label: const Text('Add to Cart'),
                        ),
                        const SizedBox(
                          width: 10,
                        ), //Horizontal gap between buttons
                        OutlinedButton(
                          onPressed: () {
                            // The navigator Command
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                  productName:
                                      'Pro Wireless Headphones', //sending the name
                                  productPrice: headphonePrice,
                                ),
                              ),
                            );
                          },
                          child: const Text('Details'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10), // Gap between rows
                    // 6. The "Management" Buttons (Remove & Empty)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            // Guard Clause Logic
                            if (cartCount > 0) {
                              setState(() {
                                cartCount--;
                                totalPrice -= headphonePrice;
                              });
                            } else {
                              // Feedback logic using the new Builder context
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Your cart is already empty!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          icon: const Icon(
                            Icons.remove_shopping_cart,
                            size: 18,
                          ),
                          label: const Text('Remove'),
                        ),
                        const SizedBox(width: 10),
                        OutlinedButton(
                          onPressed: () {
                            setState(() {
                              cartCount = 0;
                              totalPrice = 0.0;
                            });
                          },
                          child: const Text('Empty Cart'),
                        ),
                      ],
                    ),
                  ], //children
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
