
import 'package:flutter/material.dart';

class User {
  String name;
  int age;

  User({this.name = "", this.age = 0});
}

class TestCounterButton extends StatefulWidget {
  const TestCounterButton({super.key});

  @override
  State<TestCounterButton> createState() => _TestCounterButtonState();
}

class _TestCounterButtonState extends State<TestCounterButton> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit Test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
