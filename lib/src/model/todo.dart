import 'package:jsonplaceholder/src/model/model.dart';

class Todo extends Model {
  static const _KEY_USER_ID = "userId";
  static const _KEY_ID = "id";
  static const _KEY_TITLE = "title";
  static const _KEY_COMPLETED = "completed";

  final int _id;
  int userId;
  String title;
  bool completed;

  Todo(
    this.userId,
    this.title,
    this.completed, [
    this._id,
  ]);

  Todo.fromJson(Map<String, dynamic> map)
      : userId = map[_KEY_USER_ID],
        _id = map[_KEY_ID],
        title = map[_KEY_TITLE],
        completed = map[_KEY_COMPLETED];

  @override
  Map<String, dynamic> toJson() => {
        _KEY_USER_ID: userId,
        _KEY_ID: _id,
        _KEY_TITLE: title,
        _KEY_COMPLETED: completed
      };

  @override
  int get id => _id;

  @override
  String toString() => toJson().toString();
}
