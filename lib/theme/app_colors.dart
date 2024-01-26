import 'dart:ui';

class AppColors {
  static const messageColor = Color(0xFF3CED78);
  static const messageTextColor = Color(0xFF00521C);
  static const strokeColor = Color(0xFFEDF2F6);
  static const grayColor = Color(0xFF9DB7CB);
  static const darkGrayColor = Color(0xFF5E7A90);
  static const blackColor = Color(0xFF2B333E);
}

Color generateColor(String str, double s, double l) {
  var hash = 0;
  for (var i = 0; i < str.length; i++) {
    hash = str.codeUnitAt(i) + ((hash << 5) - hash);
  }

  var h = hash % 360;

  var c = (1 - (2 * l - 1).abs()) * s;
  var x = c * (1 - ((h / 60) % 2 - 1).abs());
  var m = l - c / 2;

  double r, g, b;

  if (h < 60) {
    r = c;
    g = x;
    b = 0;
  } else if (h < 120) {
    r = x;
    g = c;
    b = 0;
  } else if (h < 180) {
    r = 0;
    g = c;
    b = x;
  } else if (h < 240) {
    r = 0;
    g = x;
    b = c;
  } else if (h < 300) {
    r = x;
    g = 0;
    b = c;
  } else {
    r = c;
    g = 0;
    b = x;
  }

  return Color.fromARGB(
    255,
    ((r + m) * 255).round(),
    ((g + m) * 255).round(),
    ((b + m) * 255).round(),
  );
}
