# My Flutter Portfolio (V1)

A professional Flutter application demonstrating UI Architecture, State Management, and Scalable Logic.

## 📁 Project Structure & Raw Code

To view the core logic and architectural implementation, please see the following files:

- [**Main Logic (State & UI)**](lib/main.dart): Contains the Shopping Cart logic, LIFO Stack implementation, and ListView builder.
- [**Navigation & Details**](lib/details_screen.dart): Demonstrates data passing and multi-screen architecture.
- [**Data Model**](lib/main.dart#L4): The Product Class "Blueprint".

## 🚀 Features

- **Dynamic List Architecture:** Moved from static widgets to a `ListView.builder` factory that generates UI from data models.
- **LIFO Cart Logic:** Implemented a **Stack-Based** shopping cart (Last-In, First-Out). The "Remove" button intelligently pops the last item added and subtracts its specific price.
- **State Management:** Utilizes `setState` to sync the UI with a `List<Product>` data structure in real-time.
- **Defensive Programming:** Implemented Guard Clauses (`if (cart.isNotEmpty)`) to prevent crashes and negative counts.
- **Navigation:** Implemented "Teleportation" (Navigation) to pass specific data objects to a Details Screen.

## 🔨 Skills Demonstrated

- **Data Structures:** Manipulating Lists, Stacks, and Objects.
- **Object-Oriented Programming (OOP):** Created custom `Product` models to encapsulate data.
- **Dart Logic:** Variable initialization, math operations, and List methods (`.add`, `.removeLast`, `.clear`).
- **Flutter Framework:** Working with Context, Builders, and Material Design widgets.
- **Git Version Control:** Professional commit history and repository management.

## 💻 Code Highlight: The "Smart Remove" Logic

This snippet demonstrates the Stack Data Structure logic used to manage the cart state:

```dart
onPressed: () {
  // Guard Clause to prevent crash
  if (cart.isNotEmpty) {
    setState(() {
      // Pop the last item off the stack (LIFO)
      Product removedItem = cart.removeLast();

      // Dynamic Price Adjustment
      totalPrice -= removedItem.price;
    });
  }
}
```
