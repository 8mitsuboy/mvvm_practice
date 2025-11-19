import 'package:http/http.dart' as http;
import 'package:mvvm_practice/data/joke_api_datasource.dart';
import 'package:mvvm_practice/domain/joke_reposeitory.dart';
import 'package:mvvm_practice/domain/joke_repository_impl.dart';

class DI {
  static http.Client buildClient() => http.Client();

  static JokeApiDatasource buildDataSource() =>
      JokeApiDatasource(buildClient());

  static JokeReposeitory buildRepository() =>
      JokeRepositoryImpl(dataSource: buildDataSource());
}
