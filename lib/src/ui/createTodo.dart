import 'package:flutter/material.dart';
import 'package:todo/src/blocs/todoBloc.dart';

class CreateTodo extends StatefulWidget {
  @override
  _CreateTodoState createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
             children: <Widget>[
          TextField(
            onChanged: bloc.updateTitle,
            maxLines: 1,
            decoration: InputDecoration(hintText: 'Adicionar nome do todo'),
          ),
          TextField(
            onChanged: bloc.updateNumber,
            maxLines: 1,
            decoration: InputDecoration(hintText: 'Adicione a prioridade'),
          ),
          RaisedButton(
            onPressed: () async {
              bloc.addSaveTodo();
              await Future.delayed(const Duration(milliseconds: 500));
              bloc.fetchAllTodo();
              Navigator.of(context).pop();
            },
            child: Text('Salvar'),
          )
        ],
        ),
       
      ),
    );
  }
}