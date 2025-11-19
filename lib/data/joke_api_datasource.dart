import 'dart:convert';
import 'package:http/http.dart' as http;

// ジョーク取得に関する例外
class JokeApiException implements Exception {
  final String message;
  JokeApiException(this.message);

  @override
  String toString() => 'JokeApiException: $message';
}

class JokeApiDatasource {
  final http.Client client;

  JokeApiDatasource(this.client);

  Future<Map<String, dynamic>> fetchRandomJoke() async {
    final response = await client.get(
      Uri.parse('https://official-joke-api.appspot.com/random_joke'),
    );

    // ステータスコードチェック
    if (response.statusCode != 200) {
      throw JokeApiException('Unexpected status code: ${response.statusCode}');
    }
    // JSONパース
    final jsonMap = jsonDecode(response.body);

    // JSONフォーマットチェック
    if (jsonMap is! Map<String, dynamic>) {
      throw JokeApiException('Invalid JSON format');
    }

    return jsonMap;
  }
}
