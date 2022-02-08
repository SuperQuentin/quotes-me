import 'package:flutter/material.dart';
import 'package:startup_namer/pages/home.dart';
import 'services/quote_api.dart';
import 'pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final QuoteApi quoteApi = QuoteApi();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote-me',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(
        title: 'Quote-me daddy',
        quoteApi: quoteApi,
      ),
    );
  }
}
