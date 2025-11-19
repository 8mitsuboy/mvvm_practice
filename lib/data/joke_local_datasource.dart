class JokeLocalDatasource {
  Map<String, dynamic>? storedJoke;

  Future<Map<String, dynamic>> fetchLocalJoke() async {
    if (storedJoke == null) {
      throw Exception('ローカルデータがありません');
    }
    return storedJoke!;
  }

  Future<void> saveLocal(Map<String, dynamic> json) async {
    storedJoke = json;
  }
}
