import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class NeuButton extends StatelessWidget {

  final String btnText;
  final Color btnColor;
  final Color txtColor;
  final double fontSize;
  final double boxHeight;
  final double boxWidth;
  final Function onPressedFunc;
  NeuButton({this.txtColor, this.btnText, this.btnColor, this.onPressedFunc, this.fontSize, this.boxHeight, this.boxWidth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: boxHeight ?? 70,
        width: boxWidth ?? 70,
        child: NeumorphicButton(
          onPressed: () {
            //function
            print('i got clicked');
          },
          style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
              surfaceIntensity: .90,
              border: NeumorphicBorder(
                color: btnColor ?? Color.fromRGBO(239, 238, 238, 1),
                width: 0.0,
              )
          ),
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Text(
              btnText,
              style: GoogleFonts.montserrat(
                fontSize: fontSize ?? 25,
                fontWeight: FontWeight.w300,
                color: txtColor ?? Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}