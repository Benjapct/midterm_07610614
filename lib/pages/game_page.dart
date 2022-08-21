// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:midterm_07610614/game.dart';


class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _controller = TextEditingController();
  final _game = Game();

  // state variable
  var _feedbackText = '';
  var _showTestButton = false;

  void handleClickGuess() {
    setState(() {
      _showTestButton = !_showTestButton;
    });
    print(_controller.text);
    var guess = int.tryParse(_controller.text);
    if (guess == null) {
      //error
      setState(() {
        _feedbackText = 'Please enter a value to convert.';
      });
    } else {
      var result = _game.doGuess(guess);
      if (result == Result.tooHigh) {
        // ทายมากไป
        print('Too high');
        setState(() {
          _feedbackText = 'Too high, please try again';
        });
      } else if (result == Result.tooLow) {
        // ทายน้อยไป

        setState(() {
          _feedbackText = 'Too low, please try again';
        });
      } else {
        // ทายถูก
        print('Correct');
        setState(() {
          _feedbackText = 'Good job!';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Midterm Exame'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Temperature Converter', style: TextStyle(fontSize: 25.0, fontStyle: FontStyle.italic)),

            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a temperature value to convert',
              ),
            ),
            // Callback function
            ElevatedButton(
              onPressed: handleClickGuess,
              child: const Text('Celsius to Fahrenheit'),
            ),

            ElevatedButton(
              onPressed: handleClickGuess,
              child: const Text('Celsius to Kelvin'),
            ),

            ElevatedButton(
              onPressed: handleClickGuess,
              child: const Text('Fahrenheit to Celsius'),
            ),

            ElevatedButton(
              onPressed: handleClickGuess,
              child: const Text('Fahrenheit to Kelvin'),
            ),

            ElevatedButton(
              onPressed: handleClickGuess,
              child: const Text('Kelvin to Celsius'),
            ),

            ElevatedButton(
              onPressed: handleClickGuess,
              child: const Text('Kelvin to Fahrenheit'),
            ),

            Text(_feedbackText),
          ],
        ),
      ),
    );
  }
}
