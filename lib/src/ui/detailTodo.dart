import 'package:flutter/material.dart';
import 'package:todo/src/models/todoModels.dart';
import 'package:todo/src/blocs/todoBloc.dart';

class DetailsPageTodo extends StatefulWidget {
  
  String id;

  DetailsPageTodo(this.id);

  Todo tododetails;

  @override
  _DetailsPageTodoState createState() => _DetailsPageTodoState();
}

class _DetailsPageTodoState extends State<DetailsPageTodo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
      ),
       body: new FutureBuilder<Todo>(
          future: bloc.fetchPostId(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return buildList(snapshot); 
            }else if(snapshot.hasError){
              return Text(snapshot.error.toString());
            } return Center(child: CircularProgressIndicator(),);
          },
        ),
    );
  }
  Widget buildList(AsyncSnapshot<Todo> snapshot){
    Todo todoDetails = snapshot.data;
    child: new Text(todoDetails.name
    );
  }
    
}