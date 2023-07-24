import 'package:flutter/material.dart';

class SummaryClass extends StatelessWidget {
  const SummaryClass(this.summaryList, {super.key});
  final List<Map<String, Object>> summaryList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: SizedBox(
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...summaryList.map(
                (element) {
                  return Row(
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 193, 119, 222),
                        ),
                        child: Center(
                          child: Text(
                            (element['question_index'].toString()),
                            style: const TextStyle(
                                // backgroundColor: Color.fromARGB(255, 89, 12, 103),
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                element['question'].toString(),
                                style: const TextStyle(color: Colors.white),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                element['correct_answer'].toString(),
                                style: const TextStyle(color: Colors.green),
                              ),
                              Text(
                                element['selected_answer'].toString(),
                                style: const TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                },
              ).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
