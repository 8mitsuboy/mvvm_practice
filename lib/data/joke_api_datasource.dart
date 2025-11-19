import 'dart:convert';
import 'package:http/http.dart' as http;

class JokeApiDatasource {
  final http.Client client;

  JokeApiDatasource(this.client);

  Future<String> fetchRandomJoke() async {
    final response = await client.get(
      Uri.parse('https://official-joke-api.appspot.com/random_joke'),
    );

    final json = jsonDecode(response.body);
    return '${json['setup']}\n\n${json['punchline']}';
  }
}
