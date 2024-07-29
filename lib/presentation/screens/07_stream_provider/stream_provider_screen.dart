import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/stream_provider.dart';

class StreamProviderScreen extends StatelessWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: const StreanView(),
    );
  }
}

class StreanView extends ConsumerWidget {
  const StreanView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersInChats = ref.watch(usersInChatProvider);

    if (usersInChats.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (usersInChats.hasError) {
      return Center(
        child: Text('${usersInChats.error}'),
      );
    }

    final users = usersInChats.value!;

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        final user = users[index];
        return ListTile(
          title: Text(user),
        );
      },
    );
  }
}
