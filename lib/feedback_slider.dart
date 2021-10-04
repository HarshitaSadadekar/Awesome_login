import 'package:flutter/material.dart';
import 'quiz_brain.dart';


class headerSec extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: Text('Quiz App', style: TextStyle(color: Colors.white),),
      ),
      body: feedbackSlider(),
    );
  }
}


class feedbackSlider extends StatefulWidget {
  @override
  _feedbackSliderState createState() => _feedbackSliderState();
}

class _feedbackSliderState extends State<feedbackSlider>{

  int score=1;
  int totalscore=0;



  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget> [
        Center(
          child: Text(QuizBrain().getQuestionText()),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            inactiveTrackColor:Colors.black,
            activeTrackColor: Color(0xFFF8BBD0),
            thumbColor: Colors.yellow[700],
            overlayColor:Colors.black12,
            // activeTickMarkColor: Colors.black,
            // inactiveTickMarkColor: Colors.white,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
          ),
          child: Slider(value: score.toDouble(),
            min: 1.0, max: 5.0, divisions: 4,
            label: score.toString(),
            onChanged: (double newValue){
              setState(() {
                score=newValue.round();
              });
            },
          ),
        ),
        Container(
          child: TextButton(
              style: ButtonStyle( backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFF8BBD0)), foregroundColor:  MaterialStateProperty.all<Color>(Colors.white)),
              child: Text('Next'),
              onPressed: (){
                totalscore+=score;
                setState(() {
                  QuizBrain().nextQuestion();
                });
              }
          ),
        ),
        ScoreCard(),
      ],
    );
  }
}