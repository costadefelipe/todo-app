import 'package:todo/src/models/todoModels.dart';
import 'package:todo/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class TodoBloc{
  
  final _repository = Repository();

  final _todoFetcher = PublishSubject<List<Todo>>();
  final _todoFetcherId = PublishSubject<Todo>();
  final _title = BehaviorSubject<String>();
  final _number = BehaviorSubject<String>();
  
  Observable<List<Todo>> get allTodo => _todoFetcher.stream;
  Observable<Todo> get oneTodo =>_todoFetcherId.stream;
  Function(String) get updateTitle => _title.sink.add;
  Function(String) get updateNumber => _number.sink.add;


  fetchAllTodo() async {
    List<Todo> todo = await _repository.fetchAllTodo();
    _todoFetcher.sink.add(todo);
  }

  fetchPostId() async {
    Todo todo;
    todo = await _repository.fetchPostId(todo.id);
    _todoFetcherId.sink.add(todo);
  }

  addSaveTodo() {
    _repository.addSaveTodo(_title.value, _number.value);
  }

  dispose(){
    _todoFetcher.close();
    _title.close();
    _number.close();
    _todoFetcherId.close();
  }
}

final bloc = TodoBloc();