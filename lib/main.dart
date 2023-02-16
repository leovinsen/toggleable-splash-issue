import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
  bool _checkboxValue = false;
  bool _radioValue = false;

  static const text =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';

  @override
  Widget build(BuildContext context) {
    final loremIpsumTexts = Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.amber,
            child: const Text(text),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Expanded(
          child: Text(text),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            loremIpsumTexts,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Before (Clipped)'),
                Checkbox(
                  splashRadius: 100,
                  overlayColor:
                      MaterialStateColor.resolveWith((states) => Colors.red),
                  value: _checkboxValue,
                  onChanged: (value) {
                    setState(() {
                      _checkboxValue = value!;
                    });
                  },
                ),
                Radio<bool>(
                  splashRadius: 100,
                  overlayColor:
                      MaterialStateColor.resolveWith((states) => Colors.red),
                  groupValue: _radioValue,
                  value: true,
                  onChanged: (value) {
                    setState(() {
                      _radioValue = !_radioValue;
                    });
                  },
                ),
                const Text('After (Not Clipped)'),
              ],
            ),
            loremIpsumTexts,
          ],
        ),
      ),
    );
  }
}
