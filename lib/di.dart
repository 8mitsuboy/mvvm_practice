import 'package:http/http.dart' as http;
import 'package:mvvm_practice/data/joke_api_datasource.dart';
import 'package:mvvm_practice/data/joke_cache_datasource.dart';
import 'package:mvvm_practice/data/joke_local_datasource.dart';
import 'package:mvvm_practice/domain/joke_reposeitory.dart';
import 'package:mvvm_practice/domain/joke_repository_impl.dart';

class DI {
  static http.Client buildClient() => http.Client();

  static JokeApiDatasource buildApiDatasource() =>
      JokeApiDatasource(buildClient());

  static JokeCacheDatasource buildCacheDatasource() => JokeCacheDatasource();

  static JokeLocalDatasource buildLocalDatasource() => JokeLocalDatasource();

  static JokeReposeitory buildRepository() => JokeRepositoryImpl(
    api: buildApiDatasource(),
    cache: buildCacheDatasource(),
    local: buildLocalDatasource(),
  );
}
