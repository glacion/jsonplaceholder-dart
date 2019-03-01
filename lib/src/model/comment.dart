import 'package:jsonplaceholder/src/model/model.dart';

class Comment extends Model {
  static const _KEY_POST_ID = "postId";
  static const _KEY_ID = "id";
  static const _KEY_NAME = "name";
  static const _KEY_EMAIL = "email";
  static const _KEY_BODY = "body";

  final int _id;
  int postId;
  String name;
  String email;
  String body;

  Comment(
    this.postId,
    this.name,
    this.email,
    this.body, [
    this._id,
  ]);

  Comment.fromJson(Map<String, dynamic> map)
      : postId = map[_KEY_POST_ID],
        _id = map[_KEY_ID],
        name = map[_KEY_NAME],
        email = map[_KEY_EMAIL],
        body = map[_KEY_BODY];

  @override
  Map<String, dynamic> toJson() => {
        _KEY_POST_ID: postId,
        _KEY_ID: _id,
        _KEY_NAME: name,
        _KEY_EMAIL: email,
        _KEY_BODY: body,
      };

  @override
  int get id => _id;

  @override
  String toString() => toJson().toString();
}
