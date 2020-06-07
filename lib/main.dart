import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  /**
  * Questions = Array()
  * Array contains questions and and answers
  */
  static const _questions = [
    {
      'questionText': 'What\'s your favorite colour ?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 6},
        {'text': 'Yellow', 'score': 5},
        {'text': 'Blue', 'score': 4}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal ?',
      'answers': [
        {'text': 'Lion', 'score': 10},
        {'text': 'Zebra', 'score': 6},
        {'text': 'Frog', 'score': 5},
        {'text': 'Gorilla', 'score': 4}
      ],
    },
    {
      'questionText': 'What\'s your favorite sport ?',
      'answers': [
        {'text': 'Basket', 'score': 10},
        {'text': 'Basket', 'score': 6},
        {'text': 'Golf', 'score': 5},
        {'text': 'Tennis', 'score': 4}
      ],
    }
  ];

  var _questionIndex = 0; //Note :  _ means private class
  var _totalScore = 0;

void _resetQuiz(){
  setState(() {
    _questionIndex = 0;
    _totalScore = 0;   
  });
}

  /**
  *  _answerQuestion()
  * Increment question +1
  * return string
  */
  void _answerQuestion(int score) {

    _totalScore +=  score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('You have no more questions !');
    }
  }

  @override
  Widget build(BuildContext context) {
    /**
     * MaterialApp
     * Display Answers
     */
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
