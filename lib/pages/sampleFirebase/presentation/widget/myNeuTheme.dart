import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MyNeumorphicTheme extends StatelessWidget {
  final Widget child;

  MyNeumorphicTheme({@required this.child});

  @override
  Widget build(BuildContext context) {
    return NeumorphicTheme(
      theme: NeumorphicThemeData(
        buttonStyle: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          depth: 20,
          intensity: 0.8,
        ),
        defaultTextColor: Color(0xFF3E3E3E),
        accentColor: Colors.grey,
        variantColor: Colors.black38,
        depth: 20,
        intensity: 0.8,
      ),
      themeMode: ThemeMode.light,
      child: Material(
        child: NeumorphicBackground(
          child: child,
        ),
      ),
    );
  }
}
