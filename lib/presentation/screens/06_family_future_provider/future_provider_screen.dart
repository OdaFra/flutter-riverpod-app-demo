import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/futures_providers.dart';

class FamilyFutureScreen extends ConsumerStatefulWidget {
  const FamilyFutureScreen({super.key});

  @override
  FamilyFutureScreenState createState() => FamilyFutureScreenState();
}

class FamilyFutureScreenState extends ConsumerState<FamilyFutureScreen> {
  int pokemonId = 3;

  @override
  Widget build(BuildContext context) {
    final pokemonAsync = ref.watch(PokemonProvider(pokemonId));

    return Scaffold(
        appBar: AppBar(
          title: const Text('Family Future Provider'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text('Pokemon Id: $pokemonId'),
            ),
            Center(
              child: pokemonAsync.when(
                data: (data) => Text(data),
                error: (error, stracker) => Text('$error'),
                loading: () => const CircularProgressIndicator(),
              ),
            ),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'btn-1',
              child: const Icon(Icons.exposure_minus_1_outlined),
              onPressed: () {
                if (pokemonId <= 1) return;
                pokemonId--;
                setState(() {});
              },
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                pokemonId++;
                setState(() {});
              },
            ),
          ],
        ));
  }
}
