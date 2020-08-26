import 'dart:ui';

import 'package:color/color.dart' as c;
import 'package:shared_preferences/shared_preferences.dart';

abstract class ConfigRepo {
  Future<void> write(Color color);

  Future<Color> read();
}

class ConfigRepository implements ConfigRepo {
  @override
  Future<Color> read() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('ok');
    int r = prefs.getInt('color-r');
    int g = prefs.getInt('color-g');
    int b = prefs.getInt('color-b');
    print('okk: $r, $g, $b');
    return Color.fromARGB(255, r, g, b);
  }

  @override
  Future<void> write(Color color) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('color-r', color.red);
    await prefs.setInt('color-g', color.green);
    await prefs.setInt('color-b', color.blue);
  }
}
