# わからなかったことまとめ

1. String toString() => 'JokeApiException: $message'; この書き方というよりシンタックスシュガーわからん。

2. expect の書き方がいまいちわからん。特に ↓ の例

```dart
      expect(
        () => dataSource.fetchRandomJoke(),
        throwsA(isA<JokeApiException>()),
      );
```

第一引数に dataSource.fetchRandomJoke()としないのはなぜ？ throwsA って何だよ
Dart の test パッケージに、trhwosA()という例外マッチャーがある。

`throwsA(isA<JokeApiException>())` 第一引数の関数は JokeApiException 型の例外を投げることを期待している。

3. I/Oってなんだよ
