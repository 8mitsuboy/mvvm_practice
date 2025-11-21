import 'joke.dart';

abstract class JokeRepository {
  Future<Joke> fetchRandomJoke();
}
