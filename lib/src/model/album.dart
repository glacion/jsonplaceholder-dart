import 'package:jsonplaceholder/src/model/model.dart';

class Album extends Model {
  static const _KEY_USER_ID = "userId";
  static const _KEY_ID = "id";
  static const _KEY_TITLE = "title";

  final int _id;
  int userId;
  String title;

  Album(
    this.userId,
    this.title, [
    this._id,
  ]);

  Album.fromJson(Map<String, dynamic> map)
      : userId = map[_KEY_USER_ID],
        _id = map[_KEY_ID],
        title = map[_KEY_TITLE];

  @override
  Map<String, dynamic> toJson() => {
        _KEY_USER_ID: userId,
        _KEY_ID: _id,
        _KEY_TITLE: title,
      };

  @override
  int get id => _id;

  @override
  String toString() => toJson().toString();
}
