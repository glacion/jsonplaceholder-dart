import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:built_collection/built_collection.dart';
import 'package:jsonplaceholder/src/model/serializers.dart';
import 'package:jsonplaceholder/src/model/album.dart';
import 'package:jsonplaceholder/src/model/comment.dart';
import 'package:jsonplaceholder/src/model/photo.dart';
import 'package:jsonplaceholder/src/model/post.dart';
import 'package:jsonplaceholder/src/model/todo.dart';
import 'package:jsonplaceholder/src/model/user.dart';

class JSONPlaceholder {
  final http.Client _client;

  static const _BASE_URL = "jsonplaceholder.typicode.com";

  static const _ROUTE_ALBUMS = "albums";
  static const _ROUTE_COMMENTS = "comments";
  static const _ROUTE_PHOTOS = "photos";
  static const _ROUTE_POSTS = "posts";
  static const _ROUTE_TODOS = "todos";
  static const _ROUTE_USERS = "users";

  static const _QUERY_ALBUM_ID = "albumId";
  static const _QUERY_USER_ID = "userId";
  static const _QUERY_POST_ID = "postId";

  JSONPlaceholder({http.Client client}) : _client = client ?? http.Client();

  /// Closes the connections and cleans up the resources.
  void close() => _client.close();

  Uri _listUri(String route, [String queryKey, Object queryValue]) =>
      (queryValue == null)
          ? Uri.https(_BASE_URL, route)
          : Uri.https(
              _BASE_URL,
              route,
              {queryKey: queryValue.toString()},
            );

  Future<BuiltList<Album>> getAlbums({int userId}) async {
    var url = _listUri(_ROUTE_ALBUMS, _QUERY_USER_ID, userId);
    var response = await _client.get(url);
    return serializers.deserialize(
      json.decode(response.body),
      specifiedType: getListType(Album),
    );
  }

  Future<BuiltList<Comment>> getComments({int postId}) async {
    var url = _listUri(_ROUTE_COMMENTS, _QUERY_POST_ID, postId);
    var response = await _client.get(url);
    return serializers.deserialize(
      json.decode(response.body),
      specifiedType: getListType(Comment),
    );
  }

  Future<BuiltList<Photo>> getPhotos({int albumId}) async {
    var url = _listUri(_ROUTE_PHOTOS, _QUERY_ALBUM_ID, albumId);
    var response = await _client.get(url);
    return serializers.deserialize(
      json.decode(response.body),
      specifiedType: getListType(Photo),
    );
  }

  Future<BuiltList<Post>> getPosts({int userId}) async {
    var url = _listUri(_ROUTE_POSTS, _QUERY_USER_ID, userId);
    var response = await _client.get(url);
    return serializers.deserialize(
      json.decode(response.body),
      specifiedType: getListType(Post),
    );
  }

  Future<BuiltList<Todo>> getTodos({int userId}) async {
    var url = _listUri(_ROUTE_TODOS, _QUERY_USER_ID, userId);
    var response = await _client.get(url);
    return serializers.deserialize(
      json.decode(response.body),
      specifiedType: getListType(Todo),
    );
  }

  Future<BuiltList<User>> getUsers() async {
    var url = _listUri(_ROUTE_USERS);
    var response = await _client.get(url);
    return serializers.deserialize(
      json.decode(response.body),
      specifiedType: getListType(User),
    );
  }
}
