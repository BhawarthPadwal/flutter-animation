import 'package:animations/animation.dart';
import 'package:animations/animation_four.dart';
import 'package:flutter/material.dart';

import 'BappaMorya.dart';
import 'anana.dart';
import 'animation_three.dart';
import 'animation_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TrialTwo3(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _bigger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                width: _bigger ? 200 : 100,
                height: _bigger ? 200 : 100,
                child: Image.asset('assets/image.jpg'),
                duration: Duration(seconds: 1),
                curve: Curves.easeInOutQuint,
              ),
              ElevatedButton(onPressed: () {
                setState(() {
                  _bigger = !_bigger;
                });
              },
                  child: const Text('Change'))
            ],
          ),
        ));
  }
}
