import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertest/feature/data/todoProvider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController todo = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Consumer<TodolistProvider>(
              builder: (context, providerr, child) {
                return ListView.builder(
                  itemCount: providerr.todos.length,
                  itemBuilder: (context, index) {
                    final todo = providerr.todos[index];
                    return GestureDetector(
                      onTap: () {
                        Provider.of<TodolistProvider>(
                          context,
                          listen: false,
                        ).toggleDone(todo);
                      },
                      child: ListTile(
                        key: Key(todo.title + todo.isChecked.toString()),
                        title: Text(
                          todo.title,
                          style: TextStyle(
                            decoration:
                                todo.isChecked
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                          ),
                        ),
                        leading: Checkbox(
                          value: todo.isChecked,
                          onChanged: (value) {
                            providerr.toggleDone(todo);
                            // providerr.showItems();
                          },
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            providerr.removeTodoList(todo);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Consumer<TodolistProvider>(
        builder: (context, value, child) {
          return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('New todo'),
                    content: TextField(controller: todo),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('no'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          value.addTodoList(todo.text);
                          Navigator.pop(context);
                          todo.clear();
                        },
                        child: Text('Yes'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
