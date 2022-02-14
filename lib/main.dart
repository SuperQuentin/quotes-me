import 'package:flutter/material.dart';
import 'package:startup_namer/pages/home.dart';
import 'package:get_it/get_it.dart';
import 'services/quote_api.dart';
import 'pages/home.dart';

void main() {
  registerSingletons();
  runApp(MyApp());
}

void registerSingletons({bool testMode = false}) {
  GetIt.I.registerLazySingleton(() => QuoteApi());
  if (testMode) {
    // TODO: do something here hehe
  }
}

final _get = GetIt.I.get;

QuoteApi get quoteApi => _get<QuoteApi>();

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

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
      ),
    );
  }
}
