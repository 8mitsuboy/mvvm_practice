import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

import 'package:mvvm_practice/data/joke_api_datasource.dart';
import 'package:mvvm_practice/data/joke_cache_datasource.dart';
import 'package:mvvm_practice/data/joke_local_datasource.dart';
import 'package:mvvm_practice/domain/joke.dart';
import 'package:mvvm_practice/domain/joke_repository.dart';
import 'package:mvvm_practice/domain/joke_repository_impl.dart';

part 'joke_view_model.g.dart';

/// ① DataSource / Cache / Local の provider 群
@riverpod
JokeApiDatasource jokeApiDatasource(Ref ref) {
  final client = http.Client();
  return JokeApiDatasource(client);
}

@riverpod
JokeCacheDatasource jokeCacheDatasource(Ref ref) {
  return JokeCacheDatasource();
}

@riverpod
JokeLocalDatasource jokeLocalDatasource(Ref ref) {
  return JokeLocalDatasource();
}

/// ② Repository の provider
@riverpod
JokeRepository jokeRepository(Ref ref) {
  final api = ref.watch(jokeApiDatasourceProvider);
  final cache = ref.watch(jokeCacheDatasourceProvider);
  final local = ref.watch(jokeLocalDatasourceProvider);

  return JokeRepositoryImpl(api: api, local: local, cache: cache);
}

/// ③ ViewModel 本体
/// 状態は AsyncValue<Joke> (ローディング / 成功 / エラー) を持つ

@riverpod
class JokeViewModel extends _$JokeViewModel {
  @override
  Future<Joke> build() async {
    // 画面初期表示時に呼ばれる
    final repo = ref.read(jokeRepositoryProvider);
    return repo.fetchRandomJoke();
  }

  // Another ボタンから呼ぶメソッド
  Future<void> reload() async {
    // ローディング状態にする
    state = const AsyncValue.loading();

    try {
      final repo = ref.read(jokeRepositoryProvider);
      final joke = await repo.fetchRandomJoke();
      state = AsyncValue.data(joke);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
