import 'package:flutter/material.dart';
import 'package:messenger_app/theme/app_colors.dart';

class CircularAva extends StatelessWidget {
  final String text;
  final double size;

  const CircularAva({super.key, required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    List<String> words = text.split(' ');

    String firstLetters = words.map((word) => word[0]).join('');

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: generateColor(text, 30, 80),
      ),
      child: Center(
        child: Text(
          firstLetters,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
