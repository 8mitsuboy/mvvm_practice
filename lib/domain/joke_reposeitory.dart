import 'joke.dart';

abstract class JokeReposeitory {
  Future<Joke> fetchRandomJoke();
}
