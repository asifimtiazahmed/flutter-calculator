import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeuButton extends StatelessWidget {
  const NeuButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () {
        print("onClick");
      },
      style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.circle(),
          surfaceIntensity: .90,
          border: NeumorphicBorder(
            color: Color(0x33000000),
            width: 0.1,
          )
      ),
      padding: const EdgeInsets.all(5.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          '1',
          style: TextStyle(fontSize: 35,
          ),
        ),
      ),
    );
  }
}