import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _display = '0';
  double _result = 0;
  String _operator = '';
  String _previousNumber = '';

  void _buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      _display = '0';
      _result = 0;
      _operator = '';
      _previousNumber = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '*' ||
        buttonText == '/') {
      _operator = buttonText;
      _previousNumber = _display;
      _display = '0';
    } else if (buttonText == '=') {
      double currentNumber = double.parse(_display);
      double previousNumber = double.parse(_previousNumber);

      switch (_operator) {
        case '+':
          _result = previousNumber + currentNumber;
          break;
        case '-':
          _result = previousNumber - currentNumber;
          break;
        case '*':
          _result = previousNumber* currentNumber;
          break;
        case '/':
          _result = previousNumber / currentNumber;
          break;
      }

      _display = _result.toString();
      _operator = '';
      _previousNumber = '';
    } else {
      if (_display == '0') {
        _display = buttonText;
      } else {
        _display = _display + buttonText;
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Calculator'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12.0),
            alignment: Alignment.centerRight,
            child: Text(
              _display,
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                for (String buttonText in [
                  'C',
                  '/',
                  '*',
                  '7',
                  '8',
                  '9',
                  '-',
                  '4',
                  '5',
                  '6',
                  '+',
                  '1',
                  '2',
                  '3',
                  '0',
                  '.',
                  '=',
                ])
                  _buildButton(buttonText),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String buttonText) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          _buttonPressed(buttonText);
        },
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}