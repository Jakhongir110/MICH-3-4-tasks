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

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _input = ''; // Current input
  String _output = '0'; // Output to display
  String? _operator; // Selected operator
  double? _firstOperand; // First operand

  void _onButtonPressed(String text) {
    setState(() {
      if (RegExp(r'[0-9]').hasMatch(text)) {
        // Handle digit input
        if (_input == '0') {
          // Replace leading 0 with the entered number
          _input = text;
        } else {
          _input += text;
        }
        _output = _input;
      } else if (text == 'C') {
        // Clear everything
        _input = '';
        _output = '0';
        _operator = null;
        _firstOperand = null;
      } else if (text == '←') {
        // Handle backspace
        if (_input.isNotEmpty) {
          _input = _input.substring(0, _input.length - 1);
          _output = _input.isEmpty ? '0' : _input;
        }
      } else if (text == '.') {
        // Handle decimal point
        if (_input.isEmpty) {
          _input = '0.'; // Start with "0." if input is empty
        } else if (!_input.contains('.')) {
          _input += '.';
        }
        _output = _input;
      } else if (text == '±') {
        // Handle change sign
        if (_input.isNotEmpty && _input != '0') {
          if (_input.startsWith('-')) {
            _input = _input.substring(1);
          } else {
            _input = '-$_input';
          }
          _output = _input;
        }
      } else if (text == '=') {
        // Perform calculation
        if (_firstOperand != null && _operator != null) {
          double secondOperand = double.tryParse(_input) ?? 0.0;
          switch (_operator) {
            case '+':
              _output = (_firstOperand! + secondOperand).toString();
              break;
            case '-':
              _output = (_firstOperand! - secondOperand).toString();
              break;
            case '*':
              _output = (_firstOperand! * secondOperand).toString();
              break;
            case '/':
              _output = secondOperand != 0
                  ? (_firstOperand! / secondOperand).toString()
                  : 'Error';
              break;
            case '%':
              _output = ((_firstOperand! * secondOperand)/100).toString();
              break;
          }
          _input = '';
          _firstOperand = null;
          _operator = null;
        }
      } else {
        // Handle operator input
        if (_input.isNotEmpty) {
          _firstOperand = double.tryParse(_input);
          _operator = text;
          _input = '';
        }
      }
    });
  }

  Widget buildButton(String text, {double fontSize = 20}) {
    return GestureDetector(
      onTap: () => _onButtonPressed(text),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(4, 4),
              blurRadius: 6,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.white,
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
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.lightBlue[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.black26,
                  width: 2,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.topRight,
                child: Text(
                  _output,
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
                    buildButton('%'), // Add behavior as needed
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
                    buildButton('0'),
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
