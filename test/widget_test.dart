// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void _onButtonPressed() {
    // Обработчик нажатия на кнопку
    print('Button pressed!');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Flutter App'),
        ),
        body: Center(
          child: TextButton(
            onPressed: _onButtonPressed,
            child: Text('Нажми меня!'),
          ),
        ),
      ),
    );
  }
}
