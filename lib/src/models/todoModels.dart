import 'dart:convert';

List<Todo> todoFromJson(String str) => new List<Todo>.from(json.decode(str).map((x) => Todo.fromJson(x)));

String todoToJson(List<Todo> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class Todo {
    String id;
    String name;
    int telefone;
    bool done;
    int v;

    Todo({
        this.id,
        this.name,
        this.telefone,
        this.done,
        this.v,
    });

    factory Todo.fromJson(Map<String, dynamic> json) => new Todo(
        id: json["_id"],
        name: json["name"],
        telefone: json["telefone"],
        done: json["done"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "telefone": telefone,
        "done": done,
        "__v": v,
    };
}
