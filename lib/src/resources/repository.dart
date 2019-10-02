import 'dart:async';
import 'package:todo/src/models/todoModels.dart';
import 'package:todo/src/resources/todoApiProvider.dart';

class Repository{
  
  final todoApiProvider = TodoApiProvider();

  Future<List<Todo>> fetchAllTodo() => todoApiProvider.fetchTodoList();
  Future addSaveTodo(String title, String number ) => todoApiProvider.addTodo(title, number);
  Future<Todo> fetchPostId(String id) => todoApiProvider.fetchPostId(id);
}