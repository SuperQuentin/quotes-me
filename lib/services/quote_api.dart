import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../models/quote.dart';

class QuoteApi {
  late ValueListenable<Quote?> currentQuote;

  void fetchQuote() async {
    final response =
        await http.get(Uri.parse('https://api.quotable.io/random'));

    if (response.statusCode == 200) {
      currentQuote.addListener(() => Quote.fromJson(jsonDecode(response.body)));
    } else {
      throw Exception('fail to load quote');
    }
  }
}
