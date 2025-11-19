class JokeCacheDatasource {
  // 簡易キャッシュ
  Map<String, dynamic>? _cache;

  Future<Map<String, dynamic>> fetchCachedJoke() async {
    if (_cache == null) {
      throw Exception('キャッシュなし');
    }
    return _cache!;
  }

  Future<void> saveCache(Map<String, dynamic> json) async {
    _cache = json;
  }
}
