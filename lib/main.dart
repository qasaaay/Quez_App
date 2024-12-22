import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quez_app/model/data.dart';
import 'package:quez_app/pages/QuesionAndAnswer_Screen.dart';
import 'package:quez_app/pages/result-screen.dart';
import 'package:quez_app/pages/start_Screen.dart';

void main() {
  runApp(const MaterialApp(
    home:RootScreens()
  ));
}

class RootScreens extends StatefulWidget {
  const RootScreens({super.key});
 

  @override
  State<RootScreens> createState() => _RootScreensState();
}

class _RootScreensState extends State<RootScreens> {
   String currentScreen = 'start-screen';
   List holdSelectedAnswers=[];
   
  void switchScreen() {
    setState(() {
      currentScreen='quez-screen';
    });
  }

  void chooseAnswer(String Answer){
    holdSelectedAnswers.add(Answer);
    if(holdSelectedAnswers.length==quizData.length){
      setState(() {
        currentScreen='result-screen';
      });
    }
  }
    void restartQuiz() {
    setState(() {
      holdSelectedAnswers= [];
      currentScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                   Colors.white,
                   Colors.black,
                   ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: currentScreen == 'start-screen'
              ? StartScreen(
                  copySwitchScreen: switchScreen,
                ):currentScreen=='quez-screen'
                ?QuesionsScreen(
                ontappedAnswer: chooseAnswer,
              ):ResultSreen(chooseAnswers: holdSelectedAnswers,
              restartQuiz: restartQuiz ,
              )
      )
    );
  }
}
