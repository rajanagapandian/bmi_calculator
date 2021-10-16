// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          bodyText2: GoogleFonts.balsamiqSans(),
          bodyText1: GoogleFonts.balsamiqSans(),
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
  var _currentIndex = 0;
  var _height = 50.0;

  void _setCurrentIndex(int index) => setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'BMI Calculator',
          style: GoogleFonts.balsamiqSans(
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculate',
            backgroundColor: Colors.indigo,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
            backgroundColor: Colors.indigo,
          ),
        ],
        onTap: _setCurrentIndex,
        currentIndex: _currentIndex,
        elevation: 5,
        selectedItemColor: Colors.amber,
        backgroundColor: Colors.indigo,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.white,
        child: Column(
          children: [
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.male,
                            color: Colors.white,
                            size: 50,
                          ),
                          Text(
                            'MALE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              // fontWeight: FontWeight.w600,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.female,
                            color: Colors.white,
                            size: 50,
                          ),
                          Text(
                            'FEMALE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              // fontWeight: FontWeight.w600,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.5,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              Text('20'),
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                            children: [
                              Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              Text(
                                '20',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'KG',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'LB',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
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
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          _height.round().toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
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
                    onPressed: () {},
                    child: Text(
                      'CALCULATE',
                      style: GoogleFonts.balsamiqSans(
                        fontSize: 16,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w600,
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
