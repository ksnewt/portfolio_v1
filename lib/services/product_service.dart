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

import 'dart:convert'; // Required for decoding JSON text
import 'package:flutter/services.dart';
import '../models/product.dart';

class ProductService {
  // To simulate future Python backend implementation
  Future<List<Product>> fetchProducts() async {
    // 2-second delay for thinking simulation / loading
    await Future.delayed(const Duration(seconds: 2));

    // Reach into assets folder to grab the rawr text
    final String response = await rootBundle.loadString('assets/data/products.json');

    // Turn that long string of text into a list of Maps
    final List<dynamic> data = json.decode(response);

    // Use the fromJSON as translator to turn maps into a list of products
    return data.map((json) => Product.fromJson(json)).toList();
  }
}
