// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredTodosHash() => r'e1230c687e407191c462b6449f92f529f40eb6d6';

/// See also [filteredTodos].
@ProviderFor(filteredTodos)
final filteredTodosProvider = AutoDisposeProvider<List<Todo>>.internal(
  filteredTodos,
  name: r'filteredTodosProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredTodosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FilteredTodosRef = AutoDisposeProviderRef<List<Todo>>;
String _$todoCurrentFilterHash() => r'0426a59e43bf539d398cea7825de08f1daa907cb';

/// See also [TodoCurrentFilter].
@ProviderFor(TodoCurrentFilter)
final todoCurrentFilterProvider =
    NotifierProvider<TodoCurrentFilter, TodoFilterType>.internal(
  TodoCurrentFilter.new,
  name: r'todoCurrentFilterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todoCurrentFilterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TodoCurrentFilter = Notifier<TodoFilterType>;
String _$todosHash() => r'b0f8a5e440ec31f96f20798799864f02baabaf27';

/// See also [Todos].
@ProviderFor(Todos)
final todosProvider = NotifierProvider<Todos, List<Todo>>.internal(
  Todos.new,
  name: r'todosProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Todos = Notifier<List<Todo>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
