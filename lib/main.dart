import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

Future<Quote> fetchQuote() async {
  final response = await http.get(Uri.parse('https://api.quotable.io/random'));

  if (response.statusCode == 200) {
    return Quote.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('fail to load quote');
  }
}

class Quote {
  final String quote;
  final String author;
  final int length;

  const Quote(
      {required this.quote, required this.author, required this.length});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
        quote: json['content'], author: json['author'], length: json['length']);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Quote> mamamia;

  void _fetchQuote() {
    setState(() {
      mamamia = fetchQuote();
    });
  }

  @override
  void initState() {
    super.initState();
    mamamia = fetchQuote();
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FutureBuilder<Quote>(
                  future: mamamia,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(children: <Widget>[
                          Text(snapshot.data!.quote,
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 48)),
                          Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Text(
                                snapshot.data!.author,
                                style: TextStyle(
                                    color: Colors.blue[200], fontSize: 36),
                              )),
                          Text('Size : ${snapshot.data!.length}',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16))
                        ]),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}',
                          style: TextStyle(color: Colors.red, fontSize: 32));
                    }
                    return const CircularProgressIndicator();
                  },
                )
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchQuote,
        tooltip: 'New quote',
        child: const Icon(Icons.subdirectory_arrow_left),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
