import 'package:flutter/material.dart';

void main() => runApp(const MyProfileApp());

class MyProfileApp extends StatelessWidget {
  const MyProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900], // Background color
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 1. The Avatar (A Container box)
                const CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, size: 50, color: Color.fromARGB(255, 251, 251, 251)),
                ),
                // 2. The Name (Text widget)
                const Text(
                  'Kaleb Newton',
                  style: TextStyle(fontSize: 40.0, color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold),
                ),
                // 3. The Subtitle
                Text(
                  'FULL STACK DEVELOPER',
                  style: TextStyle(color: Colors.blue.shade100, fontSize: 20.0, letterSpacing: 2.5),
                ),
                // 4. A Divider (Like a <hr> in HTML)
                const SizedBox(height: 20, width: 150, child: Divider(color: Color.fromARGB(255, 168, 168, 28))),
                // 5. The "Action" Button
                ElevatedButton(
                  onPressed: () {
                    print("Portfolio Button Clicked!"); // This shows in your VS Code console
                  },
                  child: const Text('Contact Me'),
                ),
                
                ElevatedButton(
                  onPressed: () {
                    print("Contact Saved!");
                  }, 
                  child: const Text('Save Contact')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}