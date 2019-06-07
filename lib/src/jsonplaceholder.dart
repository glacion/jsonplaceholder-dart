import 'dart:convert';

import 'package:http/http.dart' show Client, Response;
import 'package:built_collection/built_collection.dart';
import 'package:jsonplaceholder/src/model/serializers.dart';
import 'package:jsonplaceholder/src/model/album.dart';
import 'package:jsonplaceholder/src/model/comment.dart';
import 'package:jsonplaceholder/src/model/photo.dart';
import 'package:jsonplaceholder/src/model/post.dart';
import 'package:jsonplaceholder/src/model/todo.dart';
import 'package:jsonplaceholder/src/model/user.dart';

class JSONPlaceholder {
  final Client _client;

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

  JSONPlaceholder({Client client}) : _client = client ?? Client();

  /// Closes the connections and cleans up the resources.
  void close() => _client.close();

  /// Gets the Uri for the endpoints that return a list of objects.
  ///
  /// Example: https://jsonplaceholder.typicode.com/todos
  ///          https://jsonplaceholder.typicode.com/todos?userId=1
  Uri _getListUrl(String route, [String queryKey, Object queryValue]) =>
      (queryValue == null)
          ? Uri.https(_BASE_URL, route)
          : Uri.https(
              _BASE_URL,
              route,
              {queryKey: queryValue.toString()},
            );

  /// Returns the `BuiltList` of `Album` objects.
  ///
  /// When [userId] is used; the list only contains the `Album` objects with the given userId.
  Future<BuiltList<Album>> getAlbums({int userId}) async {
    var url = _getListUrl(_ROUTE_ALBUMS, _QUERY_USER_ID, userId);
    var response = await _client.get(url);
    return serializers.deserialize(
      json.decode(response.body),
      specifiedType: getListType(Album),
    );
  }

  /// Returns the `BuiltList` of `Comment` objects.
  ///
  /// When [postId] is used; the list only contains the `Comment` objects with the given userId.
  Future<BuiltList<Comment>> getComments({int postId}) async {
    var url = _getListUrl(_ROUTE_COMMENTS, _QUERY_POST_ID, postId);
    var response = await _client.get(url);
    return serializers.deserialize(
      json.decode(response.body),
      specifiedType: getListType(Comment),
    );
  }

  /// Returns the `BuiltList` of `Photo` objects.
  ///
  /// When [albumId] is used; the list only contains the `Photo` objects with the given albumId.
  Future<BuiltList<Photo>> getPhotos({int albumId}) async {
    var url = _getListUrl(_ROUTE_PHOTOS, _QUERY_ALBUM_ID, albumId);
    var response = await _client.get(url);
    return serializers.deserialize(
      json.decode(response.body),
      specifiedType: getListType(Photo),
    );
  }

  /// Returns the `BuiltList` of `Post` objects.
  ///
  /// When [userId] is used; the list only contains the `Post` objects with the given userId.
  Future<BuiltList<Post>> getPosts({int userId}) async {
    var url = _getListUrl(_ROUTE_POSTS, _QUERY_USER_ID, userId);
    var response = await _client.get(url);
    return serializers.deserialize(
      json.decode(response.body),
      specifiedType: getListType(Post),
    );
  }

  /// Returns the `BuiltList` of `Todo` objects.
  ///
  /// When [userId] is used; the list only contains the `Todo` objects with the given userId.
  Future<BuiltList<Todo>> getTodos({int userId}) async {
    var url = _getListUrl(_ROUTE_TODOS, _QUERY_USER_ID, userId);
    var response = await _client.get(url);
    return serializers.deserialize(
      json.decode(response.body),
      specifiedType: getListType(Todo),
    );
  }

  /// Returns the `BuiltList` of `User` objects.
  Future<BuiltList<User>> getUsers() async {
    var url = _getListUrl(_ROUTE_USERS);
    var response = await _client.get(url);
    return serializers.deserialize(
      json.decode(response.body),
      specifiedType: getListType(User),
    );
  }

  /// Returns the `Uri` for the endpoint that returns a single object.
  Uri _getSingleUrl(String route, int id) => Uri.https(_BASE_URL, "$route/$id");

  /// Returns the `Album` object from given [id].
  Future<Album> getAlbum(int id) async {
    var url = _getSingleUrl(_ROUTE_ALBUMS, id);
    var response = await _client.get(url);
    return Album.fromJson(response.body);
  }

  /// Returns the `Comment` object from given [id].
  Future<Comment> getComment(int id) async {
    var url = _getSingleUrl(_ROUTE_COMMENTS, id);
    var response = await _client.get(url);
    return Comment.fromJson(response.body);
  }

  /// Returns the `Photo` object from given [id].
  Future<Photo> getPhoto(int id) async {
    var url = _getSingleUrl(_ROUTE_PHOTOS, id);
    var response = await _client.get(url);
    return Photo.fromJson(response.body);
  }

  /// Returns the `Post` object from given [id].
  Future<Post> getPost(int id) async {
    var url = _getSingleUrl(_ROUTE_POSTS, id);
    var response = await _client.get(url);
    return Post.fromJson(response.body);
  }

  /// Returns the `Todo` object from given [id].
  Future<Todo> getTodo(int id) async {
    var url = _getSingleUrl(_ROUTE_TODOS, id);
    var response = await _client.get(url);
    return Todo.fromJson(response.body);
  }

  /// Returns the `User` object from given [id].
  Future<User> getUser(int id) async {
    var url = _getSingleUrl(_ROUTE_USERS, id);
    var response = await _client.get(url);
    return User.fromJson(response.body);
  }

  /// Posts the serialized object into the given route.
  Future<Response> _post(String body, String route) async => _client.post(
        Uri.https(_BASE_URL, route),
        body: body,
        headers: {"Content-type": "application/json; charset=UTF-8"},
      );

  /// Posts the given `Album` object.
  Future<Album> postAlbum(Album album) async {
    var response = await _post(album.toJson(), _ROUTE_ALBUMS);
    return Album.fromJson(response.body);
  }

  /// Posts the given `Comment` object.
  Future<Comment> postComment(Comment comment) async {
    var response = await _post(comment.toJson(), _ROUTE_COMMENTS);
    return Comment.fromJson(response.body);
  }

  /// Posts the given `Photo` object.
  Future<Photo> postPhoto(Photo photo) async {
    var response = await _post(photo.toJson(), _ROUTE_PHOTOS);
    return Photo.fromJson(response.body);
  }

  /// Posts the given `Post` object.
  Future<Post> postPost(Post post) async {
    var response = await _post(post.toJson(), _ROUTE_POSTS);
    return Post.fromJson(response.body);
  }

  /// Posts the given `Todo` object.
  Future<Todo> postTodo(Todo todo) async {
    var response = await _post(todo.toJson(), _ROUTE_TODOS);
    return Todo.fromJson(response.body);
  }

  /// Posts the given `User` object.
  Future<User> postUser(User user) async {
    var response = await _post(user.toJson(), _ROUTE_USERS);
    return User.fromJson(response.body);
  }

  /// PUTs the serialized object into given route.
  Future<Response> _put(String body, String route, int id) async => _client.put(
        Uri.https(_BASE_URL, "$route/$id"),
        body: body,
        headers: {"Content-type": "application/json; charset=UTF-8"},
      );

  /// Updates given `Album` in the server.
  Future<Album> updateAlbum(Album album) async {
    var response = await _put(album.toJson(), _ROUTE_ALBUMS, album.id);
    return Album.fromJson(response.body);
  }

  /// Updates given `Comment` in the server.
  Future<Comment> updateComment(Comment comment) async {
    var response = await _put(comment.toJson(), _ROUTE_COMMENTS, comment.id);
    return Comment.fromJson(response.body);
  }

  /// Updates given `Photo` in the server.
  Future<Photo> updatePhoto(Photo photo) async {
    var response = await _put(photo.toJson(), _ROUTE_PHOTOS, photo.id);
    return Photo.fromJson(response.body);
  }

  /// Updates given `Post` in the server.
  Future<Post> updatePost(Post post) async {
    var response = await _put(post.toJson(), _ROUTE_POSTS, post.id);
    return Post.fromJson(response.body);
  }

  /// Updates given `Todo` in the server.
  Future<Todo> updateTodo(Todo todo) async {
    var response = await _put(todo.toJson(), _ROUTE_TODOS, todo.id);
    return Todo.fromJson(response.body);
  }

  /// Updates given `User` in the server.
  Future<User> updateUser(User user) async {
    var response = await _put(user.toJson(), _ROUTE_USERS, user.id);
    return User.fromJson(response.body);
  }

  /// Deletes the object at given endpoint.
  void _delete(String route, int id) async =>
      await _client.delete(Uri.https(_BASE_URL, '$route/$id'));

  /// Deletes given `Album`
  void deleteAlbum(Album album) async => await _delete(
        _ROUTE_ALBUMS,
        album.id,
      );

  /// Deletes given `Comment`
  void deleteComment(Comment comment) async => await _delete(
        _ROUTE_COMMENTS,
        comment.id,
      );

  /// Deletes given `Photo`
  void deletePhoto(Photo photo) async => await _delete(
        _ROUTE_PHOTOS,
        photo.id,
      );

  /// Deletes given `Post`
  void deletePost(Post post) async => await _delete(
        _ROUTE_POSTS,
        post.id,
      );

  /// Deletes given `Todo`
  void deleteTodo(Todo todo) async => await _delete(
        _ROUTE_TODOS,
        todo.id,
      );

  /// Deletes given `User`
  void deleteUser(User user) async => await _delete(
        _ROUTE_USERS,
        user.id,
      );
}
