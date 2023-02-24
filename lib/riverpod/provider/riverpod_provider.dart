import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_project/riverpod/provider/riverpod_provider_demo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'riverpod_provider.g.dart';

@riverpod
List<Todo> completedTodos(CompletedTodosRef ref) {
  final todos = ref.watch(todosProvider);
  // we return only the completed todos
  return todos.where((todo) => todo.isCompleted).toList();
}

class RiverpodProvider extends ConsumerWidget {
  const RiverpodProvider({Key? key}) : super(key: key);

  static Route get route {
    return MaterialPageRoute(builder: (_) {
      return const RiverpodProvider();
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosProvider);
    final completedTodos = ref.watch(completedTodosProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod Provider"),
      ),
      body: Column(
        children: [
          const PreviousButton(),
          MaterialButton(
              color: Colors.greenAccent,
              child: const Text("add data"),
              onPressed: () {
                // final todos = Todos();
                for (int i = 0; i <= 100; i++) {
                  ref.read(todosProvider.notifier).addTodo(Todo(
                      "${Random().nextInt(100)}",
                      (Random().nextInt(100) % 2 == 0)));
                }
              }),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: todos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 50,
                        child: Center(
                            child: Text(
                                '${todos[index].description}  ${todos[index].isCompleted}')),
                      );
                    }),
              ),
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: completedTodos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 50,
                        child: Center(
                            child: Text(
                                '${completedTodos[index].description} ${completedTodos[index].isCompleted}')),
                      );
                    }),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class Todo {
  Todo(this.description, this.isCompleted);

  final bool isCompleted;
  final String description;
}

@riverpod
class Todos extends _$Todos {
  @override
  List<Todo> build() {
    return [];
  }

  void addTodo(Todo todo) {
    state = [...state, todo];
  }
}
