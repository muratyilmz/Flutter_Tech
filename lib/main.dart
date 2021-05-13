import 'package:flutter/material.dart';
import 'package:flutter_news_task_app/view/home/view/news_details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsDetails(),
    );
  }
}
