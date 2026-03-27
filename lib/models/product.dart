/* * KALEB NEWTON | March 2026
 * FILE: lib/models/product.dart
 * * --- THE DATA BLUEPRINT ---
 * This file defines the core 'Product' object for the entire ecosystem. 
 * It acts as the "Single Source of Truth" for how product data (Names, Prices, Icons) 
 * is structured before it ever hits the screen.
 * * ENGINEERING HIGHLIGHT: 
 * Includes a 'fromJson' factory constructor. This is our "Translator" that 
 * allows the app to take raw data from a Python/SQL backend and turn it into 
 * a type-safe Dart object.
 */

import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final IconData icon;

  Product({required this.name, required this.price, required this.icon});

  // --- THE TRANSLATOR (Level 9) ---
  // This turns a JSON Map into a Product Object
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['price'],
      icon: json['icon'],
    );
  }
}
