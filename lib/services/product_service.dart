/* * KALEB NEWTON | March 2026
 * FILE: lib/services/product_service.dart
 * * --- THE API SERVICE LAYER ---
 * This is the "Brain" of our data communication. Its only job is to handle 
 * outbound requests and inbound data. 
 * * ENGINEERING HIGHLIGHT: 
 * Implements Asynchronous Logic (Futures). By separating this from the UI, 
 * we ensure the app remains fast and responsive even if the internet is slow. 
 * This is where we will eventually plug in our Python Web-Scrapers.
 */

import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductService {
  // To simulate future Python backend implementation
  Future<List<Product>> fetchProducts() async {
    // 2-second delay for thinking simulation
    await Future.delayed(const Duration(seconds: 2));

    return [
      Product(name: 'Pro Headphones', price: 199.99, icon: Icons.headset),
      Product(name: 'Smart Watch', price: 249.99, icon: Icons.watch),
      Product(name: 'Wireless Mouse', price: 49.99, icon: Icons.mouse),
      Product(name: 'Gaming Keyboard', price: 129.99, icon: Icons.keyboard),
    ];
  }
}
