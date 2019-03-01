import 'package:jsonplaceholder/src/model/model.dart';

class Post extends Model {
  static const _KEY_USER_ID = "userId";
  static const _KEY_ID = "id";
  static const _KEY_TITLE = "title";
  static const _KEY_BODY = "body";

  final int _id;
  int userId;
  String title;
  String body;

  Post(
    this.userId,
    this.title,
    this.body, [
    this._id,
  ]);

  Post.fromJson(Map<String, dynamic> map)
      : userId = map[_KEY_USER_ID],
        _id = map[_KEY_ID],
        title = map[_KEY_TITLE],
        body = map[_KEY_BODY];

  @override
  Map<String, dynamic> toJson() => {
        _KEY_USER_ID: userId,
        _KEY_ID: _id,
        _KEY_TITLE: title,
        _KEY_BODY: body,
      };

  @override
  int get id => _id;

  @override
  String toString() => toJson().toString();
}
