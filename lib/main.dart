import 'package:flutter/material.dart';
import 'package:flutter_crud_sqflite/database_helper.dart';
import 'package:flutter_crud_sqflite/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo-List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final TextEditingController _searchController = TextEditingController();
  final dbhelper = DatabaseHelper;
  final List<Todo> _todos = [
    Todo(id: "01", title: "dummy", description: "deskripsi", completed: true)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (_) {},
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                var todo = _todos[index];
                return ListTile(
                  title: Text(todo.title),
                  subtitle: Text(todo.description),
                  trailing: IconButton(
                    icon: todo.completed
                        ? const Icon(Icons.check_box)
                        : const Icon(Icons.check_box_outline_blank),
                    onPressed: () {
                      // setState(() {
                      //   todo.completed = !todo.completed;
                      // });

                      // database.updateTodo(todo);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Tambah Todo'),
              content: const TextField(
                decoration: InputDecoration(hintText: 'Judul todo'),
              ),
              actions: [
                TextButton(
                  child: const Text('Batalkan'),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: const Text('Tambah'),
                  onPressed: () {
                    // var todo = Todo(
                    //   title: TextField.of(context).text,
                    //   description: '',
                    //   completed: false,
                    // );

                    // database.insertTodo(todo);

                    // Navigator.pop(context);
                    // setState(() {
                    //   _todos.add(todo);
                    // });
                  },
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
