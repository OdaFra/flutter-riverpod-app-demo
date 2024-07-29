import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/presentation/providers/todo_change_notifier_provider.dart';

class ChangeNotifierScreen extends ConsumerWidget {
  const ChangeNotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier Provider'),
      ),
      body: const _TodoView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(todosChangeNotifierProvider.notifier).addTodo();
        },
      ),
    );
  }
}

class _TodoView extends ConsumerWidget {
  const _TodoView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosChange = ref.watch(todosChangeNotifierProvider);
    final todos = todosChange.todos;

    return Column(
      children: [
        const ListTile(
          title: Text('Listado de invitados'),
          subtitle: Text('Estas son las personas a invitar a la fiesta'),
        ),

        // Listado de personas a invitar
        Expanded(
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return SwitchListTile(
                title: Text(todo.description),
                value: todo.done,
                onChanged: (value) {
                  ref
                      .read(todosChangeNotifierProvider.notifier)
                      .toggleTodo(todo.id);
                },
              );
            },
          ),
        )
      ],
    );
  }
}
