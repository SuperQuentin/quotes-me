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
