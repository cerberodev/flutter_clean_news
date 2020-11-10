import 'package:flutter/material.dart';
import 'package:flutter_clean/presentation/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Clean News',
      home: HomeView(),
    );
  }
}
