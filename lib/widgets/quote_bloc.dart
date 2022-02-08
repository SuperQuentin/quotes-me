import 'package:flutter/material.dart';
import 'package:startup_namer/models/quote.dart';

class QuoteBlocWidget extends StatelessWidget {
  QuoteBlocWidget({Key? key, required this.currentQuote}) : super(key: key);

  late Future<Quote> currentQuote;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FutureBuilder<Quote>(
          future: currentQuote,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(32),
                child: Column(children: <Widget>[
                  Text(snapshot.data!.quote,
                      style: TextStyle(color: Colors.purple, fontSize: 48)),
                  Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        snapshot.data!.author,
                        style:
                            TextStyle(color: Colors.purple[200], fontSize: 36),
                      )),
                  Text('Size : ${snapshot.data!.length}',
                      style: TextStyle(color: Colors.grey, fontSize: 16))
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
    );
  }
}
