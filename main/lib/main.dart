import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatelessWidget {
  Widget buildButton(String text, {double fontSize = 20}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8), // Rounded corners
      boxShadow: [
        BoxShadow(
          color: Colors.black26, // Shadow color
          offset: Offset(4, 4), // Shadow position (x, y)
          blurRadius: 6, // How "soft" the shadow looks
          spreadRadius: 1, // Spread of the shadow
        ),
        BoxShadow(
          color: Colors.white, // Light shadow to mimic a raised effect
          offset: Offset(-2, -2),
          blurRadius: 6,
        ),
      ],
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: SafeArea(
        child: Column(
          children: [
            // Display Area
              Container(
              margin: const EdgeInsets.all(16), // Add space around the box
                decoration: BoxDecoration(
                 color: Colors.lightBlue[100], // Background color for the outer box
                borderRadius: BorderRadius.circular(8), // Rounded corners
                border: Border.all(
                color: Colors.black26, // Border color
               width: 2, // Border width
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.centerRight,
                  child: const Text(
                    '0', // Display text
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

            // Buttons Area
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                color: Colors.lightBlue[50],
                child: GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  children: [
                    buildButton('C'),
                    buildButton('±'),
                    buildButton('%'),
                    buildButton('+'),
                    buildButton('7'),
                    buildButton('8'),
                    buildButton('9'),
                    buildButton('-'),
                    buildButton('4'),
                    buildButton('5'),
                    buildButton('6'),
                    buildButton('*'),
                    buildButton('1'),
                    buildButton('2'),
                    buildButton('3'),
                    buildButton('/'),
                    buildButton('0', fontSize: 24),
                    buildButton('←'),
                    buildButton('.'),
                    buildButton('='),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
