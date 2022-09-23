import 'package:flutter/material.dart';
import 'package:five_apps/quiz_screen.dart';

class Quiz extends StatelessWidget {
  const Quiz({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const QuizScreen());
  }
}
