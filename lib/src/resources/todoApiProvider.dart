import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client;
import 'package:todo/src/models/todoModels.dart';

class TodoApiProvider{
  
  Client client = Client();
  final _url = "http://10.0.2.2:3000/api/";
  
  Future<List<Todo>> fetchTodoList() async{
    print('Entrar');
    final response = await client.get(_url);
    if(response.statusCode == 200){
      return compute(todoFromJson, response.body);
    }else{
      throw Exception('Falha no Load');
    }
  } 

  Future<Todo> fetchPostId(id) async {
    print('Entrar PostId');
    final response = await client.get("_url/"+ id.int.parse());
    if(response.statusCode == 200){
      return compute(id, response.body);
    }else{
      throw Exception('Falha no Load');
    }
  }

  Future addTodo(title, number) async {
    final response  = await client.post("$_url/create",body: {
      'name': title,
      'telefone': number
    });
    if(response.statusCode == 200){
      return response;
    }else{
      throw Exception('Falha ao cadastrar');
    }
  }

}