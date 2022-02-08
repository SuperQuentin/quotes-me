import 'package:flutter/material.dart';
import 'package:startup_namer/services/quote_api.dart';
import 'package:startup_namer/widgets/quote_bloc.dart';
import '../models/quote.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title, required this.quoteApi})
      : super(key: key);

  final String title;
  late QuoteApi quoteApi;

  @override
  State<HomePage> createState() => _HomePageState(quoteApi: quoteApi);
}

class _HomePageState extends State<HomePage> {
  _HomePageState({required this.quoteApi});

  late Future<Quote> currentQuote;
  final QuoteApi quoteApi;

  void __fetchQuote() {
    setState(() {
      currentQuote = quoteApi.fetchQuote();
    });
  }

  @override
  void initState() {
    __fetchQuote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: QuoteBlocWidget(
              currentQuote: currentQuote,
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: __fetchQuote,
        tooltip: 'New quote',
        child: const Icon(Icons.subdirectory_arrow_left),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
