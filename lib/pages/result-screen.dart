import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quez_app/model/data.dart';
import 'package:quez_app/pages/quesionSummary/quesion_summary.dart';

class ResultSreen extends StatelessWidget {
  List chooseAnswers =[];
    final void Function() restartQuiz;
   ResultSreen({super.key,
  required this.chooseAnswers,
  required this.restartQuiz
  
  }
  
  );

 List<Map<String,Object>> get summaryData{
  final List<Map<String,Object>> summary=[];

  for(int i =0;i<chooseAnswers.length;i++){
    summary.add(
       {
        'question_index': i,
        'question': quizData[i].text,
        'correct_answer': quizData[i].answers[0],
        'user_answer': chooseAnswers[i]
       }
    );
  }

  return summary;

 }
  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = quizData.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['correct_answer']==data['user_answer'];
      
    },).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: () {
                restartQuiz();
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.restart_alt_outlined),
              label: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}
