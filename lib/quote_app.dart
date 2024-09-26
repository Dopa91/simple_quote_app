import 'package:flutter/material.dart';
import 'package:simple_quote_app/data/quote_repository.dart';
import 'package:simple_quote_app/data/multiple_quote_repository.dart';
import 'package:simple_quote_app/model/quote_data.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({super.key, required this.repository});

  final QuoteRepository repository;

  @override
  Widget build(BuildContext context) {
    final QuoteData quote = repository.getQuote();
    final String author = quote.author;
    final String text = quote.text;
    final int ranking = quote.ranking;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Quote App"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 128),
              const Text(
                "Willkommen zur Zitate-App!",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 64),
              Text(
                text,
                //style: const TextStyle(fontSize: 16),
              ),
              Text("- $author"),
              const SizedBox(height: 16),
              Text("Ranking: $ranking/10"),
              const SizedBox(
                height: 32,
              ),
              Container(
                color: Colors.blue,
                child: IconButton(
                    onPressed: () => repository.getQuote,
                    icon: const Icon(
                      Icons.cake,
                      color: Colors.purple,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
