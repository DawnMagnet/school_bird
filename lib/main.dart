import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'dart:io';

Future<void> setFreshRate() async {
  if (Platform.isAndroid) {
    try {
      // var modes = await FlutterDisplayMode.supported;
      // print("[All Display Mode For This Machine]:\n");
      // modes.forEach(print);
      /// On Redmi K50 Ultra:
      // [  +34 ms] I/flutter (30240): #0 0x0 @ 0Hz
      // [        ] I/flutter (30240): #1 1220x2712 @ 60Hz
      // [        ] I/flutter (30240): #2 1220x2712 @ 120Hz
      // [        ] I/flutter (30240): #3 1220x2712 @ 90Hz
      await FlutterDisplayMode.setHighRefreshRate();
    } on PlatformException {
      return;
    }
  }
}

void main() {
  runApp(const MyApp());
  setFreshRate();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter += 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
              style: Theme.of(context).textTheme.headline4,
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
