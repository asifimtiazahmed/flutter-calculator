import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'neu_button.dart';
import 'calc_brain.dart';
import 'myTheme.dart';

void main() => runApp(MyApp());
MyTheme currentTheme = MyTheme();

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // MyTheme currentTheme = MyTheme();

  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      print('Theme changed');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: currentTheme.currentTheme(),
      theme: NeumorphicThemeData(
        defaultTextColor: Colors.black87,
        baseColor: Color(0xFFFFFFFF),
        lightSource: LightSource.topLeft,
        accentColor: Colors.green,
        depth: 4,
        intensity: 0.6,
      ),
      darkTheme: NeumorphicThemeData(
        baseColor: Color(0xFF3E3E3E),
        lightSource: LightSource.top,
        depth: 4,
        intensity: 0.6,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CalcBrain calc = CalcBrain();

  void btnPush(String num) {
    setState(() {
      calc.getInput(num);
    });
  }

  bool isSwitched = false;
  //MyTheme currentTheme = MyTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            calc.display() ?? 'ERR',
                            style: GoogleFonts.montserrat(
                              fontSize: 55,
                              //fontWeight: FontWeight.w200,
                              //color: Color(0xFF55FE32),
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                (isSwitched)
                                    ? isSwitched = false
                                    : isSwitched = true;
                                if (isSwitched) {
                                  print('on');
                                  currentTheme.switchTheme();
                                } else {
                                  print('off');
                                  currentTheme.switchTheme();
                                }
                              });
                            },
                            activeTrackColor: Colors.grey,
                            activeColor: Colors.red[900],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NeuButton(
                          btnText: 'AC',
                          onPressedFunc: () {
                            setState(() {
                              calc.reset();
                            });
                          },
                        ),
                        NeuButton(
                          btnText: '+/-',
                          onPressedFunc: () {
                            setState(() {
                              calc.plusMinus();
                            });
                          },
                        ),
                        NeuButton(
                          btnText: '%',
                          onPressedFunc: () {
                            setState(() {
                              calc.mainCalculator('%');
                            });
                          },
                        ),
                        NeuButton(
                          btnText: '÷',
                          onPressedFunc: () {
                            setState(() {
                              calc.mainCalculator('÷');
                            });
                          },
                          txtColor: Colors.orange,
                          fontSize: 40,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NeuButton(
                            btnText: '7',
                            onPressedFunc: () {
                              btnPush('7');
                            }),
                        NeuButton(
                            btnText: '8',
                            onPressedFunc: () {
                              btnPush('8');
                            }),
                        NeuButton(
                            btnText: '9',
                            onPressedFunc: () {
                              btnPush('9');
                            }),
                        NeuButton(
                          btnText: 'x',
                          onPressedFunc: () {
                            setState(() {
                              calc.mainCalculator('x');
                            });
                          },
                          txtColor: Colors.orange,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NeuButton(
                            btnText: '4',
                            onPressedFunc: () {
                              btnPush('4');
                            }),
                        NeuButton(
                            btnText: '5',
                            onPressedFunc: () {
                              btnPush('5');
                            }),
                        NeuButton(
                            btnText: '6',
                            onPressedFunc: () {
                              btnPush('6');
                            }),
                        NeuButton(
                          btnText: '-',
                          onPressedFunc: () {
                            setState(() {
                              calc.mainCalculator('-');
                            });
                          },
                          txtColor: Colors.orange,
                          fontSize: 40,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NeuButton(
                            btnText: '1',
                            onPressedFunc: () {
                              btnPush('1');
                            }),
                        NeuButton(
                            btnText: '2',
                            onPressedFunc: () {
                              btnPush('2');
                            }),
                        NeuButton(
                            btnText: '3',
                            onPressedFunc: () {
                              btnPush('3');
                            }),
                        NeuButton(
                          btnText: '+',
                          onPressedFunc: () {
                            setState(() {
                              calc.mainCalculator('+');
                            });
                          },
                          txtColor: Colors.orange,
                          fontSize: 40,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NeuButton(
                          btnText: '0',
                          onPressedFunc: () {
                            btnPush('0');
                          },
                          boxWidth: 170,
                        ),
                        NeuButton(
                            btnText: '.',
                            onPressedFunc: () {
                              btnPush('.');
                            }),
                        NeuButton(
                          btnText: '=',
                          onPressedFunc: () {
                            setState(() {
                              calc.equals();
                            });
                          },
                          txtColor: Colors.orange,
                          fontSize: 40,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '123',
                          style: GoogleFonts.montserrat(
                            fontSize: 60,
                            //fontWeight: FontWeight.w200,
                            //color: Color(0xFF55FE32),
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NeuButton(
                        btnText: 'AC',
                      ),
                      NeuButton(
                        btnText: '+/-',
                      ),
                      NeuButton(
                        btnText: '%',
                      ),
                      NeuButton(
                        btnText: '÷',
                        txtColor: Colors.orange,
                        fontSize: 40,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NeuButton(
                        btnText: '7',
                      ),
                      NeuButton(
                        btnText: '8',
                      ),
                      NeuButton(
                        btnText: '9',
                      ),
                      NeuButton(
                        btnText: 'X',
                        txtColor: Colors.orange,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NeuButton(
                        btnText: '4',
                      ),
                      NeuButton(
                        btnText: '5',
                      ),
                      NeuButton(
                        btnText: '6',
                      ),
                      NeuButton(
                        btnText: '-',
                        txtColor: Colors.orange,
                        fontSize: 40,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NeuButton(
                        btnText: '1',
                      ),
                      NeuButton(
                        btnText: '2',
                      ),
                      NeuButton(
                        btnText: '3',
                      ),
                      NeuButton(
                        btnText: '+',
                        txtColor: Colors.orange,
                        fontSize: 40,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NeuButton(
                        btnText: '0',
                        boxWidth: 170,
                      ),
                      NeuButton(
                        btnText: '.',
                      ),
                      NeuButton(
                        btnText: '=',
                        txtColor: Colors.orange,
                        fontSize: 40,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
