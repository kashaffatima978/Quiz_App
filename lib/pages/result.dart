import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/pages/summary.dart';

class Result extends StatelessWidget {
  Result(this.selectedAnswers, this.onRestart, {super.key});
  final List<String> selectedAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < questions.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'selected_answer': selectedAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final totalQuestions = questions.length;
    final summaryData = getSummaryData();
    final totalRightQuestions = summaryData.where((data) {
      return data['correct_answer'] == data['selected_answer'];
    }).length;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "You answerd $totalRightQuestions out of $totalQuestions questions",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SummaryClass(getSummaryData()),
          OutlinedButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.restart_alt),
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              label: const Text('Restart Quiz')),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
