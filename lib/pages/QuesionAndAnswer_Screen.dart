import 'package:flutter/material.dart';
import 'package:quez_app/model/data.dart';

class QuesionsScreen extends StatefulWidget {
  final void Function(String answer) ontappedAnswer;
 
  const QuesionsScreen({super.key,
  required this.ontappedAnswer
  
  });

  @override
  State<QuesionsScreen> createState() => _QuesionsScreenState();
}

class _QuesionsScreenState extends State<QuesionsScreen> {
  int indexofdata = 0;

  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Text(quizData[ indexofdata].text,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
          ),
          SizedBox(height: 20,),
          ...quizData[indexofdata].answers.map((answer){
            return ElevatedButton(
              child: Text(answer)
              ,
                  onPressed: () {
                    setState(() {
                      widget.ontappedAnswer(answer);
                      indexofdata++;
                    });
                  },
                );
        
          })
          ]
        ),
      ),
    );
  }
}