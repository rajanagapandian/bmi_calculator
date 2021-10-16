// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum Gender { male, female }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: TextTheme(
          bodyText2: GoogleFonts.bebasNeue(),
          bodyText1: GoogleFonts.bebasNeue(),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _height = 160.0,
      _calculated = false,
      _weight = 60,
      _bmi = 0.0,
      _category = '';

  void _calculate() {
    var heightInMts = _height / 100;
    var bmi = _weight / (heightInMts * heightInMts);
    var category = '';
    if (bmi < 18.5) {
      category = '(Underweight)';
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      category = '(Normal)';
    } else if (bmi >= 25 && bmi <= 29.9) {
      category = '(Overweight)';
    } else if (bmi >= 30) {
      category = '(Obese)';
    }
    setState(() {
      _bmi = bmi;
      _category = category;
      _calculated = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'BMI',
          style: GoogleFonts.righteous(
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
            fontSize: 25,
            // letterSpacing: 1.5,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(16.0),
                  gradient: LinearGradient(begin: Alignment.topLeft, colors: [
                    Colors.amber,
                    Colors.amberAccent,
                  ]),
                ),
                child: _calculated
                    ? Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Your BMI',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.indigo,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'score is',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.indigo,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _bmi.toStringAsFixed(2),
                                  style: TextStyle(
                                    fontSize: 50,
                                    color: Colors.indigo,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  _category,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.indigo,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'stay happy',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.indigo,
                                ),
                              ),
                              Text(
                                'and',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.indigo,
                                ),
                              ),
                              Text(
                                'healthy !',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.indigo,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.5,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (_weight > 2) _weight--;
                                  });
                                },
                                child: Icon(
                                  Icons.remove_circle_outline_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              Text(
                                _weight.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (_weight <= 149) _weight++;
                                  });
                                },
                                child: Icon(
                                  Icons.add_circle_outline_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'KG',
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                // color: Colors.indigo,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                    ),
                    Slider(
                      activeColor: Colors.amber,
                      inactiveColor: Colors.white,
                      value: _height,
                      divisions: 150,
                      min: 50,
                      max: 200,
                      label: _height.round().toString(),
                      onChanged: (double value) {
                        setState(
                          () {
                            _height = value;
                          },
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _height.round().toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'CM',
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.amber),
                    ),
                    onPressed: _calculate,
                    child: Text(
                      'CALCULATE',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 24,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w400,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
