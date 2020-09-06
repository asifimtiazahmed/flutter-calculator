import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'neu_button.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
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
        lightSource: LightSource.topLeft,
        depth: 3.5,
        intensity: 0.8,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}
 String finalResult = '12345';

class _MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text( finalResult,
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
                        NeuButton(btnText: 'AC',),
                        NeuButton(btnText: '+/-',),
                        NeuButton(btnText: '%',),
                        NeuButton(btnText: '÷', txtColor: Colors.orange, fontSize: 40,)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NeuButton(btnText: '7',),
                        NeuButton(btnText: '8',),
                        NeuButton(btnText: '9',),
                        NeuButton(btnText: 'X', txtColor: Colors.orange,)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NeuButton(btnText: '4',),
                        NeuButton(btnText: '5',),
                        NeuButton(btnText: '6',),
                        NeuButton(btnText: '-', txtColor: Colors.orange,)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NeuButton(btnText: '1',),
                        NeuButton(btnText: '2',),
                        NeuButton(btnText: '3',),
                        NeuButton(btnText: '+', txtColor: Colors.orange,)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NeuButton(btnText: '0', boxWidth: 170,),
                        NeuButton(btnText: '.',),
                        NeuButton(btnText: '=', txtColor: Colors.orange,)
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

