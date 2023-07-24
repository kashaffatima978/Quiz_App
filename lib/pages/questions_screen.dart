import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/pages/answers.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.chooseAnswes, {super.key});
  final void Function(String answer) chooseAnswes;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  int index = 0;

  void changeQuestion(String answer) {
    widget.chooseAnswes(answer);
    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[index];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                currentQuestion.text,
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              ...currentQuestion.getShuffleAnswers().map(
                    (ans) => Answers(
                      ans,
                      () {
                        changeQuestion(ans);
                      },
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
