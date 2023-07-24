import 'package:flutter/material.dart';

class MainAppPage extends StatelessWidget {
  const MainAppPage(this.switchScreen, {super.key});
  final void Function() switchScreen;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(115, 255, 255, 255),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: switchScreen,
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('start quiz'),
          ),
        ],
      ),
    );
  }
}
