import 'package:mvvm_practice/data/joke_api_datasource.dart';
import 'package:mvvm_practice/data/joke_cache_datasource.dart';
import 'package:mvvm_practice/data/joke_local_datasource.dart';
import 'package:mvvm_practice/domain/joke.dart';
import 'package:mvvm_practice/domain/joke_reposeitory.dart';

class JokeRepositoryImpl implements JokeReposeitory {
  final JokeApiDatasource api;
  final JokeLocalDatasource local;
  final JokeCacheDatasource cache;

  JokeRepositoryImpl({
    required this.api,
    required this.local,
    required this.cache,
  });

  @override
  Future<Joke> fetchRandomJoke() async {
    // 1. キャッシュから取得
    try {
      final json = await cache.fetchCachedJoke();
      return Joke.fromJson(json);
    } catch (_) {}

    // 2. ローカルDBから取得
    try {
      final json = await local.fetchLocalJoke();
      // キャッシュにも保存（おまけ）
      await cache.saveCache(json);
      return Joke.fromJson(json);
    } catch (_) {}

    // 3. 最後にAPIから取得
    final json = await api.fetchRandomJoke();

    // API取得成功したら、キャッシュ・ローカル両方に保存
    await cache.saveCache(json);
    await local.saveLocal(json);

    return Joke.fromJson(json);
  }
}
