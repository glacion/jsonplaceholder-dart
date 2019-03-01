import 'package:jsonplaceholder/src/model/model.dart';

class Photo extends Model {
  static const _KEY_ALBUM_ID = "albumId";
  static const _KEY_ID = "id";
  static const _KEY_TITLE = "title";
  static const _KEY_URL = "url";
  static const _KEY_THUMBNAIL_URL = "thumbnailUrl";

  final int _id;
  int albumId;
  String title;
  String url;
  String thumbnailUrl;

  Photo(
    this.albumId,
    this.title,
    this.url,
    this.thumbnailUrl, [
    this._id,
  ]);

  Photo.fromJson(Map<String, dynamic> map)
      : albumId = map[_KEY_ALBUM_ID],
        _id = map[_KEY_ID],
        title = map[_KEY_TITLE],
        url = map[_KEY_URL],
        thumbnailUrl = map[_KEY_THUMBNAIL_URL];

  @override
  Map<String, dynamic> toJson() => {
        _KEY_ALBUM_ID: albumId,
        _KEY_ID: _id,
        _KEY_TITLE: title,
        _KEY_URL: url,
        _KEY_THUMBNAIL_URL: thumbnailUrl
      };

  @override
  int get id => _id;

  @override
  String toString() => toJson().toString();
}
