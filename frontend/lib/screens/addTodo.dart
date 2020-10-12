import 'package:frontend/api/api.dart';
import 'package:frontend/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final todoTitleController = TextEditingController();

  void onAdd() {
    final String textVal = todoTitleController.text;

    if (textVal.isNotEmpty) {
      final Todo todo = Todo(title: textVal);
      Provider.of<TodoProvider>(context, listen: false).addTodo(todo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Todo')),
      body: ListView(
        children: [
          Container(
              child: Column(
            children: [
              TextField(
                controller: todoTitleController,
              ),
              RaisedButton(
                  child: Text('Add'),
                  onPressed: () {
                    onAdd();
                    Navigator.of(context).pop();
                  })
            ],
          ))
        ],
      ),
    );
  }
}
