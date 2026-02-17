import 'package:flutter/material.dart';
import 'details_screen.dart';

// --- THE BLUEPRINT ---
class Product {
  final String name;
  final double price;
  final IconData icon;

  Product({required this.name, required this.price, required this.icon});
}

void main() => runApp(const MyProfileApp());

class MyProfileApp extends StatefulWidget {
  const MyProfileApp({super.key});

  @override
  State<MyProfileApp> createState() => _MyProfileAppState();
}

class _MyProfileAppState extends State<MyProfileApp> {
  // --- STATE VARIABLES (Logic) ---
  List<Product> cart = [];
  double totalPrice = 0.0;

  // --- THE DATA WAREHOUSE ---
  final List<Product> products = [
    Product(name: 'Pro Headphones', price: 199.99, icon: Icons.headset),
    Product(name: 'Smart Watch', price: 249.99, icon: Icons.watch),
    Product(name: 'Wireless Mouse', price: 49.99, icon: Icons.mouse),
    Product(name: 'Gaming Keyboard', price: 129.99, icon: Icons.keyboard),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: SafeArea(
          child: Builder(
            builder: (BuildContext context) {
              return Column(
                children: [
                  // New: The Status Display
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Cart: ${cart.length} items | Total: \$${totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // --- LEVEL 8: DYNAMIC LIST FACTORY ---
                  Expanded(
                    child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final item = products[index];

                        return Card(
                          color: Colors.blueGrey[800],
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 8,
                          ),
                          child: ListTile(
                            // 1. The Avatar (Now dynamic for each product)
                            leading: CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Icon(item.icon, color: Colors.white),
                            ),

                            // 2. The Name (Now displays item.name)
                            title: Text(
                              item.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // 3. The Subtitle (Now displays item.price)
                            subtitle: Text(
                              '\$${item.price.toStringAsFixed(2)}',
                              style: TextStyle(color: Colors.blue.shade100),
                            ),

                            // 5. The "Action" Buttons (Add & Details)
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.add_shopping_cart,
                                    color: Colors.greenAccent,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      cart.add(item);
                                      totalPrice += item.price; // Dynamic logic
                                    });
                                  },
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    // The navigator Command
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailsScreen(
                                          productName: item.name,
                                          productPrice: item.price,
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text('Details'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 10), // Gap between rows
                  // 6. The "Management" Buttons (Remove & Empty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            // LAST IN FIRST OUT !!!
                            if (cart.isNotEmpty) {
                              setState(() {
                                // 1. Remove the last item and save it to a variable
                                Product removedItem = cart.removeLast();
                                // 2. Subtract specific item's price
                                totalPrice -= removedItem.price;
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
                              cart.clear();
                              totalPrice = 0.0;
                            });
                          },
                          child: const Text('Empty Cart'),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
