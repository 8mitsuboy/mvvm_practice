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


4. build_runner実行前にproviderを定義していくときに、補完効かなくてだるい
  → flutter pub run build_runner watch --delete-conflicting-outputs コマンドだと常時build_runnerが生成すべき差分を監視し、都度自動生成してくれるので、補完が効くようになって激アツ


5. _$JokeViewModelってなに？ extedsってなに？継承？ implimentとの違いは？

6. なんでリポジトリのProvider内も依存する local, cache, api provider をwatchしているの？ 一度読んだらそれで終わりでよく読んだらそれで終わりで良くなそれで終わりで良くないか？
→ 他の画面で api, local cacheを別のdatasourceに切り替えた際に、それに察知してripositryProviderを提供してほしいから。
↑ ぶっちゃけ現時点で、そんなことある？？って感じ
↑テスト時とか！ 環境切り替える際とか！ プロダクトコードを普通に実行していく分には変わることはないけど、テスト時とかプロダクトコードを実行した上で、mockのdatasourceに切り替える必要があるので、そのときproviderが察知してくれる！

*だから、基本的に依存しているProviderにはref.watchしとくのが無難！*


ref.readはイベントハンドラーとかで一瞬使いたい（変化しない）ときに使う