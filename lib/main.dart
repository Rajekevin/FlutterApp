import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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
  var _questionIndex = 0; //Note :  _ means private class

  /**
  * Questions = Array()
  * Array contains questions and and answers
  */
  static const questions = [
    {
      'questionText': 'What\'s your favorite colour ?',
      'answers': ['Black', 'Red', 'Yellow', 'Blue'],
    },
    {
      'questionText': 'What\'s your favorite animal ?',
      'answers': ['Lion', 'Zebra', 'Gorilla', 'Frog'],
    },
    {
      'questionText': 'What\'s your favorite sport ?',
      'answers': ['Basket', 'Soccer', 'Golf', 'Tennis'],
    }
  ];

  /**
  *  _answerQuestion()
  * Increment question +1
  * return string
  */
  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < questions.length) {
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
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            /**
             * Select the right answer for question
             */
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
