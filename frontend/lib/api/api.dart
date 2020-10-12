import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/todo.dart';

class TodoProvider with ChangeNotifier {
  TodoProvider() {
    this.fetchTasks();
  }

  List<Todo> _todos = [];

  List<Todo> get todos {
    return [..._todos];
  }

  fetchTasks() async {
    final url = "http://10.0.2.2:8000/api/?format=json";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _todos = data.map<Todo>((json) => Todo.fromJson(json)).toList();
    }
  }
}
