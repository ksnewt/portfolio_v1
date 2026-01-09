import 'package:flutter/material.dart';

void main() => runApp(const MyProfileApp());

class MyProfileApp extends StatefulWidget {
  const MyProfileApp({super.key});

  @override
  State<MyProfileApp> createState() => _MyProfileAppState();
}

class _MyProfileAppState extends State<MyProfileApp> {
  @override
  int cartCount = 0;
  double totalPrice = 0.0;
  int removecartCount = -1;

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900], // Background color
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Cart: $cartCount items | Total: \$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                // 1. The Avatar (A Container box)
                const CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.shopping_bag, size: 100, color: Color.fromARGB(255, 251, 251, 251)),
                ),
                // 2. The Name (Text widget)
                const Text(
                  'Pro Wireless Headphones',
                  style: TextStyle(fontSize: 20.0, color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold),
                ),
                // 3. The Subtitle
                Text(
                  '\$299.99',
                  style: TextStyle(color: Colors.blue.shade100, fontSize: 20.0, letterSpacing: 2.5),
                ),
                // 4. A Divider (Like a <hr> in HTML)
                const SizedBox(height: 20, width: 150, child: Divider(color: Color.fromARGB(255, 168, 168, 28))),
                // 5. The "Action" Button (Now with an Icon!)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                      setState(() {
                        cartCount++; // Increment the count
                        totalPrice += 299.99; // Add the price of the headphones
                      });
                      print("Current Total: \$$totalPrice");
                    }, 
                    icon: const Icon(Icons.shopping_cart, size: 18),
                    label: const Text('Add to Cart'),
                    ),
                    const SizedBox(width: 10), //Horizontal gap between buttons
                    OutlinedButton(
                      onPressed: (){
                      print('Details Clicked');
                    }, 
                    child: const Text('Details')
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // Subtract if there are items in the cart
                      setState(() {
                        if (cartCount >0 ){
                          cartCount--; // Increment the count
                          totalPrice -= 299.99; // Add the price of the headphones
                        }
                      });
                      print("Current Total: \$$totalPrice");
                    }, 
                    icon: const Icon(Icons.shopping_cart, size: 18),
                    label: const Text('Remove from Cart'),
                    ),
                    const SizedBox(width: 10), //Horizontal gap between buttons
                    OutlinedButton(
                      onPressed: (){
                      setState(() {
                        cartCount = 0;
                        totalPrice = 0;
                      });
                    }, 
                    child: const Text('Empty Cart')
                    )
                  ],
                ),
              ], //children
            ),
          ),
        ),
      ),
    );
  }
}