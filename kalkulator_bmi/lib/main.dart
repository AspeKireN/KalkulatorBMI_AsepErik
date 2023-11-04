import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kalkulator BMI'),
        ),
        body: BMICalculatorApp(),
      ),
    );
  }
}

class BMICalculatorApp extends StatefulWidget {
  @override
  _BMICalculatorAppState createState() => _BMICalculatorAppState();
}

class _BMICalculatorAppState extends State<BMICalculatorApp> {
  double height = 170;
  double weight = 70;
  double bmi = 0;

  void calculateBMI() {
    setState(() {
      bmi = weight / ((height / 100) * (height / 100));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Tinggi (cm):',
            style: TextStyle(fontSize: 24),
          ),
          Slider(
            value: height,
            min: 100,
            max: 220,
            onChanged: (value) {
              setState(() {
                height = value;
              });
            },
          ),
          Text(
            height.toStringAsFixed(1),
            style: TextStyle(fontSize: 24),
          ),
          Text(
            'Berat (kg):',
            style: TextStyle(fontSize: 24),
          ),
          Slider(
            value: weight,
            min: 30,
            max: 150,
            onChanged: (value) {
              setState(() {
                weight = value;
              });
            },
          ),
          Text(
            weight.toStringAsFixed(1),
            style: TextStyle(fontSize: 24),
          ),
          ElevatedButton(
            onPressed: () {
              calculateBMI();
            },
            child: Text('Hitung BMI'),
          ),
          Text(
            'BMI: ${bmi.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
