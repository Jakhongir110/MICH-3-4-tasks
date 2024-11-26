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
  Widget buildButton(String text, Color bgColor, Color textColor) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(20),
        ),
        onPressed: () {}, // No logic here
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: textColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: Column(
        children: [
          // Display Area
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              color: Colors.lightBlue[100],
              child: const Text(
                '0', // Static display
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Buttons Area
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(12),
              child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: [
                  buildButton('C', Colors.white, Colors.black),
                  buildButton('±', Colors.white, Colors.black),
                  buildButton('%', Colors.white, Colors.black),
                  buildButton('+', Colors.white, Colors.black),
                  buildButton('7', Colors.white, Colors.black),
                  buildButton('8', Colors.white, Colors.black),
                  buildButton('9', Colors.white, Colors.black),
                  buildButton('-', Colors.white, Colors.black),
                  buildButton('4', Colors.white, Colors.black),
                  buildButton('5', Colors.white, Colors.black),
                  buildButton('6', Colors.white, Colors.black),
                  buildButton('*', Colors.white, Colors.black),
                  buildButton('1', Colors.white, Colors.black),
                  buildButton('2', Colors.white, Colors.black),
                  buildButton('3', Colors.white, Colors.black),
                  buildButton('/', Colors.white, Colors.black),
                  buildButton('0', Colors.white, Colors.black),
                  buildButton('←', Colors.white, Colors.black),
                  buildButton('.', Colors.white, Colors.black),
                  buildButton('=', Colors.white, Colors.black),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
