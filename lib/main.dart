import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App with SharedPreferences',
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late int counter;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  _loadCounter() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt('counter') ?? 0;
    });
  }

  _incrementCounter() async {
    setState(() {
      counter++;
    });
    await prefs.setInt('counter', counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Counter App with SharedPreferences'),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Counter Value:',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '$counter',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: Text('Increment Counter'),
                ),
              ],
            ),
            ),
        );
    }
}