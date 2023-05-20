import 'package:flutter/material.dart';
import 'package:bmi/widgets/custom_button.dart';
import 'package:bmi/widgets/custom_column.dart';
import 'package:bmi/widgets/custom_container.dart';
import 'dart:math';

enum g { m, f }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final activeColor = Colors.white30;
  final inactiveColor = Colors.white12;
  int height = 160;
  int weight = 60;
  g isSelected = g.f;
  int age = 25;
  String bmi = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomContainer(
                      color: isSelected == g.m ? activeColor : inactiveColor,
                      onTap: () {
                        setState((){
                          isSelected = g.m;  
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Female',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10, 
                  ),
                  Expanded(
                    child: CustomContainer(
                      color: isSelected == g.f ? activeColor : inactiveColor,
                      onTap: () {
                        setState((){
                          isSelected = g.f;  
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Male',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CustomContainer(
                height: 100,
                color: activeColor,
                child: CustomColumn(
                  text: 'Height $height cm',
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Colors.green,
                      overlayColor: Color(0x2900ff00),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.floor();
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomContainer(
                      color: inactiveColor,
                      child: CustomColumn(
                        text: 'Weight ${weight}',
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                onTap: () {
                                  setState((){
                                    weight--;
                                  });
                                },
                                icon: Icons.arrow_downward,
                              ),
                              SizedBox(
                                width: 10, 
                              ),
                              CustomButton(
                                onTap: () {
                                  setState((){
                                    weight++;
                                  });
                                },
                                icon: Icons.arrow_upward,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomContainer(
                      color: inactiveColor,
                      child: CustomColumn(
                        text: 'Age ${age}',
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                onTap: () {
                                  setState((){
                                    age = age - 1;
                                  });
                                },
                                icon: Icons.arrow_downward,
                              ),
                              SizedBox(
                                width: 10, 
                              ),
                              CustomButton(
                                onTap: () {
                                  setState((){
                                    age = age + 1;
                                  });
                                },
                                icon: Icons.arrow_upward,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CustomContainer(
                        onTap: () {
                          setState(() {
                            bmi = '';
                          });
                        },
                        color: activeColor,
                        child: Text(
                          'Clear',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        )
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CustomContainer(
                        onTap: () {
                          double _bmi = weight / pow(height / 100, 2);

                          setState(() {
                            bmi = bmi.toStringAsFixed(1);
                          });
                        },
                        color: Colors.green,
                        child: Text(
                          'GET BMI',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        )
                      ),
                    ),
                  ),
                ]
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomContainer(
                      color: activeColor,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: CustomColumn(
                          text: 'YOUR BMI IS',
                          child:  Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              '$bmi',
                              style: TextStyle(fontSize: 20)
                            ),
                          ), 
                        ),
                      ),
                    ),
                  ),  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
