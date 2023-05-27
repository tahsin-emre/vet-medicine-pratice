import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SWE212 Vet-Medicine Mock-Up',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My-Vet'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
