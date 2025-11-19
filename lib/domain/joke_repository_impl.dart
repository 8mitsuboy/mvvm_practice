import 'package:mvvm_practice/data/joke_api_datasource.dart';
import 'package:mvvm_practice/domain/joke.dart';
import 'package:mvvm_practice/domain/joke_reposeitory.dart';

class JokeRepositoryImpl implements JokeReposeitory {
  final JokeApiDatasource dataSource;

  JokeRepositoryImpl({required this.dataSource});

  @override
  Future<Joke> fetchRandomJoke() async {
    // DataSource が渡す raw JSON を Domain Model に変換する
    final data = await dataSource.fetchRandomJoke();

    return Joke.fromJson(data);
  }
}
