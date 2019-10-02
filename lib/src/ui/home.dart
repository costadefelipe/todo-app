import 'package:flutter/material.dart';
import 'package:todo/src/blocs/todoBloc.dart';
import 'package:todo/src/models/todoModels.dart';
import 'package:todo/src/ui/createTodo.dart';
import 'package:todo/src/ui/detailTodo.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    bloc.fetchAllTodo();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Lista Todo'),
        ),
        body: StreamBuilder(
          stream: bloc.allTodo,
          builder: (context, AsyncSnapshot<List<Todo>> snapshot){
            if(snapshot.hasData){
              return buildList(snapshot); 
            }else if(snapshot.hasError){
              return Text(snapshot.error.toString());
            } return Center(child: CircularProgressIndicator(),);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CreateTodo()));
          },
          child: Icon(Icons.add),
        ),
      );
  }

  Widget buildList(AsyncSnapshot<List<Todo>> snapshot){
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index){
        return ListTile(
          title: Text('${snapshot.data[index].telefone}'),
          subtitle: Text(snapshot.data[index].name),
          onTap: (){
            Navigator.push(context, new MaterialPageRoute(builder: (context) => new DetailsPageTodo(snapshot.data[index].id)
            )
            );
          },
        );
      },
    );
  }
}