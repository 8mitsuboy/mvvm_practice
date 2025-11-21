import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mvvm_practice/application/joke_view_model.dart';

class JokePage extends ConsumerWidget {
  const JokePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ViewModel の状態 (AsyncValue<Joke>) を取得
    final state = ref.watch(jokeViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Joke app")),
      body: Center(
        child: state.when(
          data: (joke) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${joke.setup}\n\n${joke.punchline}',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  ref.read(jokeViewModelProvider.notifier).reload();
                },
                child: const Text('Another'),
              ),
            ],
          ),
          error: (e, _) => Text('Error: $e'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
