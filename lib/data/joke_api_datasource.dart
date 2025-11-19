import 'dart:convert';
import 'dart:io';
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

  Future<String> fetchRandomJoke() async {
    try {
      final response = await client.get(
        Uri.parse('https://official-joke-api.appspot.com/random_joke'),
      );

      // ステータスコードチェック
      if (response.statusCode != 200) {
        throw JokeApiException(
          'Unexpected status code: ${response.statusCode}',
        );
      }
      // JSONパース
      final json = jsonDecode(response.body);

      // JSONフォーマットチェック
      if (json is! Map<String, dynamic>) {
        throw JokeApiException('Invalid JSON format');
      }

      final setup = json['setup'];
      final punchline = json['punchline'];

      if (setup is! String || punchline is! String) {
        throw JokeApiException('Missing joke fields');
      }

      return '$setup\n\n$punchline';
    } catch (e) {
      // 想定外の例外
      throw JokeApiException('予期せぬエラーが発生しました: $e');
    }
  }
}
