import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../data/joke_api_datasource.dart';

class JokePage extends StatefulWidget {
  const JokePage({super.key});

  @override
  State<JokePage> createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  final JokeApiDatasource _jokeApiDatasource = JokeApiDatasource(http.Client());
  String? _joke;
  bool _loading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  Future<void> _fetch() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final joke = await _jokeApiDatasource.fetchRandomJoke();
      setState(() => _joke = joke);
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());
    if (_error != null) return Center(child: Text('Error: $_error'));
    if (_joke == null) return const Center(child: Text('No joke'));

    return Scaffold(
      appBar: AppBar(title: const Text("Joke App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(_joke!, textAlign: TextAlign.center),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: _fetch, child: const Text('Another')),
          ],
        ),
      ),
    );
  }
}
