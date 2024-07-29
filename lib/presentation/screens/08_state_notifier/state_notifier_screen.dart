import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class StateNotifierScreen extends ConsumerWidget {
  const StateNotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Notifier Provider'),
      ),
      body: const _TodoView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(todosStateNotifierProvider.notifier).addTodo();
        },
      ),
    );
  }
}

class _TodoView extends ConsumerWidget {
  const _TodoView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilter = ref.watch(todoCurrentFilterProvider);
    final todos = ref.watch(filteredGuestProvider);

    return Column(
      children: [
        const ListTile(
          title: Text('Listado de invitados'),
          subtitle: Text('Estas son las personas a invitar a la fiesta'),
        ),

        SegmentedButton(
          segments: const [
            ButtonSegment(value: TodoFilterType.all, icon: Text('Todos')),
            ButtonSegment(
                value: TodoFilterType.completed, icon: Text('Invitados')),
            ButtonSegment(
                value: TodoFilterType.pending, icon: Text('No invitados')),
          ],
          selected: <TodoFilterType>{currentFilter},
          onSelectionChanged: (value) {
            ref.watch(todoCurrentFilterProvider.notifier).setFilter(
                  value.first,
                );
          },
        ),
        const SizedBox(height: 5),

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
                      .read(todosStateNotifierProvider.notifier)
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
