import 'feedback_slider.dart';
import 'package:flutter/material.dart';


// class QuizBrain extends StatefulWidget {
//   @override
//   _QuizBrainScreenState createState() => _QuizBrainScreenState();
// }
// class _QuizBrainScreenState extends State<QuizBrain>{
class QuizBrain {
  int _questionNumber=0;
  List<Question> _questionBank=[
    Question( questionText: 'How would you rate your experience with us?' ),
    Question( questionText: 'How did you appreciate the sanitation?'),
    Question( questionText: 'How was the Sound Quality?'),
    Question( questionText: 'How was the Lighting?'),
    Question(questionText: 'How likely are you to recommend this to your friends?'),
    Question( questionText: 'How likely are you to come back here?'),

  ];


  void nextQuestion(){
    if(_questionNumber<_questionBank.length-1){
      _questionNumber++;
    }
    // else if(_questionNumber==_questionBank.length-1){
    // Navigator.push(context, MaterialPageRoute(builder: (context){
    // return ScoreCard();
    // }));
    // }
  }

  String getQuestionText(){
    return _questionBank[_questionNumber].questionText;
  }

  void reset(){
    _questionNumber=0;
  }

// @override
// Widget build(BuildContext context) {
//   return Container();
// }
}



class Question{
  String questionText;

  Question({ required this.questionText});
}





