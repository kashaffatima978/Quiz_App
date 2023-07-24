import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/pages/main_app_page.dart';
import 'package:quiz_app/pages/questions_screen.dart';
import 'package:quiz_app/pages/result.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];
  int marks = 2;
  //init method if ypu dont use ternery operator
  // @override
  // void initState() {
  //   activeScreen = MainAppPage(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'quiz-screen';
      selectedAnswers = [];
    });
  }

  void chooseAnswes(String answers) {
    selectedAnswers.add(answers);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 62, 22, 130),
                Color.fromARGB(255, 120, 30, 165),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen == 'start-screen'
              ? MainAppPage(switchScreen)
              : (activeScreen == 'result')
                  ? Result(selectedAnswers, switchScreen)
                  : QuestionsScreen(chooseAnswes),
        ),
      ),
    );
  }
}
