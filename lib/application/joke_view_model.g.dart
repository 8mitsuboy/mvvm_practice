// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// ① DataSource / Cache / Local の provider 群

@ProviderFor(jokeApiDatasource)
const jokeApiDatasourceProvider = JokeApiDatasourceProvider._();

/// ① DataSource / Cache / Local の provider 群

final class JokeApiDatasourceProvider
    extends
        $FunctionalProvider<
          JokeApiDatasource,
          JokeApiDatasource,
          JokeApiDatasource
        >
    with $Provider<JokeApiDatasource> {
  /// ① DataSource / Cache / Local の provider 群
  const JokeApiDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'jokeApiDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$jokeApiDatasourceHash();

  @$internal
  @override
  $ProviderElement<JokeApiDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  JokeApiDatasource create(Ref ref) {
    return jokeApiDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(JokeApiDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<JokeApiDatasource>(value),
    );
  }
}

String _$jokeApiDatasourceHash() => r'ba3e966029429d808f4a095cef3f2b8c695f5190';

@ProviderFor(jokeCacheDatasource)
const jokeCacheDatasourceProvider = JokeCacheDatasourceProvider._();

final class JokeCacheDatasourceProvider
    extends
        $FunctionalProvider<
          JokeCacheDatasource,
          JokeCacheDatasource,
          JokeCacheDatasource
        >
    with $Provider<JokeCacheDatasource> {
  const JokeCacheDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'jokeCacheDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$jokeCacheDatasourceHash();

  @$internal
  @override
  $ProviderElement<JokeCacheDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  JokeCacheDatasource create(Ref ref) {
    return jokeCacheDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(JokeCacheDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<JokeCacheDatasource>(value),
    );
  }
}

String _$jokeCacheDatasourceHash() =>
    r'8720a800322d00af7b8612f515a8f8ad32984a2e';

@ProviderFor(jokeLocalDatasource)
const jokeLocalDatasourceProvider = JokeLocalDatasourceProvider._();

final class JokeLocalDatasourceProvider
    extends
        $FunctionalProvider<
          JokeLocalDatasource,
          JokeLocalDatasource,
          JokeLocalDatasource
        >
    with $Provider<JokeLocalDatasource> {
  const JokeLocalDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'jokeLocalDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$jokeLocalDatasourceHash();

  @$internal
  @override
  $ProviderElement<JokeLocalDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  JokeLocalDatasource create(Ref ref) {
    return jokeLocalDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(JokeLocalDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<JokeLocalDatasource>(value),
    );
  }
}

String _$jokeLocalDatasourceHash() =>
    r'dda7d6c848efe7383e10fc8dd7d0f7ec6a324454';

/// ② Repository の provider

@ProviderFor(jokeRepository)
const jokeRepositoryProvider = JokeRepositoryProvider._();

/// ② Repository の provider

final class JokeRepositoryProvider
    extends $FunctionalProvider<JokeRepository, JokeRepository, JokeRepository>
    with $Provider<JokeRepository> {
  /// ② Repository の provider
  const JokeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'jokeRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$jokeRepositoryHash();

  @$internal
  @override
  $ProviderElement<JokeRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  JokeRepository create(Ref ref) {
    return jokeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(JokeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<JokeRepository>(value),
    );
  }
}

String _$jokeRepositoryHash() => r'519d96245b4e54e284d0b3369842e05668f0d43a';

/// ③ ViewModel 本体
/// 状態は AsyncValue<Joke> (ローディング / 成功 / エラー) を持つ

@ProviderFor(JokeViewModel)
const jokeViewModelProvider = JokeViewModelProvider._();

/// ③ ViewModel 本体
/// 状態は AsyncValue<Joke> (ローディング / 成功 / エラー) を持つ
final class JokeViewModelProvider
    extends $AsyncNotifierProvider<JokeViewModel, Joke> {
  /// ③ ViewModel 本体
  /// 状態は AsyncValue<Joke> (ローディング / 成功 / エラー) を持つ
  const JokeViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'jokeViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$jokeViewModelHash();

  @$internal
  @override
  JokeViewModel create() => JokeViewModel();
}

String _$jokeViewModelHash() => r'2e3c653129b3de8f3a067fdc4484777332fd69e7';

/// ③ ViewModel 本体
/// 状態は AsyncValue<Joke> (ローディング / 成功 / エラー) を持つ

abstract class _$JokeViewModel extends $AsyncNotifier<Joke> {
  FutureOr<Joke> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<Joke>, Joke>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Joke>, Joke>,
              AsyncValue<Joke>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
