import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  Answers(this.answer, this.onTap, {super.key});
  final String answer;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 40, vertical: 10),
        backgroundColor: const Color.fromARGB(255, 47, 3, 64),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        answer,
        textAlign: TextAlign.center,
      ),
    );
  }
}
