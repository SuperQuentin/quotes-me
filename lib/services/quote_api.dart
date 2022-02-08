import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../models/quote.dart';

class QuoteApi {
  Future<Quote> fetchQuote() async {
    final response =
        await http.get(Uri.parse('https://api.quotable.io/random'));

    if (response.statusCode == 200) {
      return Quote.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('fail to load quote');
    }
  }
}
