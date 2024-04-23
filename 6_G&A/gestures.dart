import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestures and Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Random _random = Random();
  late bool _isCircle;
  late String _imageUrl;

  @override
  void initState() {
    super.initState();
    _isCircle = true;
    _imageUrl =
        'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg';
  }

  void _changeShape() {
    setState(() {
      _isCircle = !_isCircle;
    });
  }
  void _changeImage() {
    setState(() {
      _imageUrl =
          'https://picsum.photos/300/300?random=${_random.nextInt(100)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestures and Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: _changeShape,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: _isCircle ? BoxShape.circle : BoxShape.rectangle,
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _changeImage,
              child: Image.network(
                _imageUrl,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
