import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'package:mvvm_practice/data/joke_api_datasource.dart';

void main() {
  group('JokeApiDataSource', () {
    test('正常系: ジョークの文字列を返す', () async {
      // Arrange
      final mockClient = MockClient((request) async {
        expect(
          request.url.toString(),
          'https://official-joke-api.appspot.com/random_joke',
        );

        final body = jsonEncode({
          'setup': 'Why did the developer go broke?',
          'punchline': 'Because he used up all his cache.',
        });

        return http.Response(body, 200);
      });

      final dataSource = JokeApiDatasource(mockClient);
      // Act
      final joke = await dataSource.fetchRandomJoke();

      // Assert
      expect(
        joke,
        'Why did the developer go broke?\n\nBecause he used up all his cache.',
      );
    });

    test('異常系: ステータスコードが200以外ならJokeApiExepetion', () async {
      final mockClient = MockClient((request) async {
        return http.Response('error', 500);
      });

      final dataSource = JokeApiDatasource(mockClient);

      expect(
        () => dataSource.fetchRandomJoke(),
        throwsA(isA<JokeApiException>()),
      );
    });

    test('異常系: ステータスコードが200でも期待通りでないJSON形式ならJokeApiExcepetion', () async {
      final mockClient = MockClient((request) async {
        return http.Response('not json', 200);
      });

      final dataSource = JokeApiDatasource(mockClient);

      expect(
        () => dataSource.fetchRandomJoke(),
        throwsA(isA<JokeApiException>()),
      );
    });
  });
}
