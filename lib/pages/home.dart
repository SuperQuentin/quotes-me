import 'package:flutter/material.dart';
import 'package:startup_namer/main.dart';
import 'package:startup_namer/widgets/quote_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: QuoteBlocWidget()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => quoteApi.fetchQuote(),
        tooltip: 'New quote',
        child: const Icon(Icons.subdirectory_arrow_left),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
