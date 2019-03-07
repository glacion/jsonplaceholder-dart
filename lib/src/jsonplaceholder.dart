import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jsonplaceholder/src/model/album.dart';
import 'package:jsonplaceholder/src/model/comment.dart';
import 'package:jsonplaceholder/src/model/photo.dart';
import 'package:jsonplaceholder/src/model/model.dart';

import 'package:jsonplaceholder/src/model/post.dart';
import 'package:jsonplaceholder/src/model/todo.dart';
import 'package:jsonplaceholder/src/model/user/user.dart';
import 'package:meta/meta.dart';

class JSONPlaceholder {
  final http.Client _client;

  static const _BASE_URL = "jsonplaceholder.typicode.com";

  static const _ROUTE_POSTS = "posts";
  static const _ROUTE_COMMENTS = "comments";
  static const _ROUTE_ALBUMS = "albums";
  static const _ROUTE_PHOTOS = "photos";
  static const _ROUTE_USERS = "users";
  static const _ROUTE_TODOS = "todos";

  static const _QUERY_USER_ID = "userId";
  static const _QUERY_ALBUM_ID = "albumId";
  static const _QUERY_POST_ID = "postId";

  JSONPlaceholder({http.Client client}) : _client = client ?? http.Client();

  /// Closes the connections and cleans up the resources.
  void close() => _client.close();

  /// Async function that returns a single `dynamic` object from given [uri].
  Future<dynamic> _getFuture(Uri uri) async {
    var response = await _client.get(uri);
    return json.decode(response.body);
  }

  /// Async function that returns a single `Todo` object from its given [id].
  Future<Todo> getTodo({@required int id}) async {
    var uri = Uri.https(_BASE_URL, '$_ROUTE_TODOS/$id');
    var response = await _getFuture(uri);
    return Todo.fromJson(response);
  }

  /// Async function that returns a single `User` object from its given [id].
  Future<User> getUser({@required int id}) async {
    var uri = Uri.https(_BASE_URL, '$_ROUTE_USERS/$id');
    var response = await _getFuture(uri);
    return User.fromJson(response);
  }

  /// Async function that returns a single `Comment` object from its given [id].
  Future<Comment> getComment({@required int id}) async {
    var uri = Uri.https(_BASE_URL, '$_ROUTE_COMMENTS/$id');
    var response = await _getFuture(uri);
    return Comment.fromJson(response);
  }

  /// Async function that returns a single `Album` object from its given [id].
  Future<Album> getAlbum({@required int id}) async {
    var uri = Uri.https(_BASE_URL, '$_ROUTE_ALBUMS/$id');
    var response = await _getFuture(uri);
    return Album.fromJson(response);
  }

  /// Async function that returns a single `Photo` object from its given [id].
  Future<Photo> getPhoto({@required int id}) async {
    var uri = Uri.https(_BASE_URL, '$_ROUTE_PHOTOS/$id');
    var response = await _getFuture(uri);
    return Photo.fromJson(response);
  }

  /// Async function that returns a single `Post` object from its given [id].
  Future<Post> getPost({@required int id}) async {
    var uri = Uri.https(_BASE_URL, '$_ROUTE_POSTS/$id');
    var response = await _getFuture(uri);
    return Post.fromJson(response);
  }

  /// Returns an `Uri` for given [route] and [params].
  /// Used for `List` requests.
  ///
  /// Example: `https://jsonplaceholder.typicode.com/posts?userId=1`
  Uri _getListUri(String route, [String query, int id]) =>
      id == null || query == null
          ? Uri.https(_BASE_URL, route)
          : Uri.https(_BASE_URL, route, {query: id.toString()});

  /// Returns the `List` of `Post` objects.
  ///
  /// When [userId] is used; the list only contains the `Post` objects with the given userId.
  Future<List<Post>> getPosts({int userId}) async {
    var uri = _getListUri(_ROUTE_POSTS, _QUERY_USER_ID, userId);
    var response = await _client.get(uri);
    var res = List<Post>();
    for (var item in json.decode(response.body)) res.add(Post.fromJson(item));
    return res;
  }

  /// Returns the `List` of `Comment` objects.
  ///
  /// When [postId] is used; the list only contains the `Comment` objects with the given userId.
  Future<List<Comment>> getComments({int postId}) async {
    var uri = _getListUri(_ROUTE_POSTS, _QUERY_POST_ID, postId);
    var response = await _client.get(uri);
    var res = List<Comment>();
    for (var item in json.decode(response.body))
      res.add(Comment.fromJson(item));
    return res;
  }

  /// Returns the `List` of `Album` objects.
  ///
  /// When [userId] is used; the list only contains the `Album` objects with the given userId.
  Future<List<Album>> getAlbums({int userId}) async {
    var uri = _getListUri(_ROUTE_POSTS, _QUERY_USER_ID, userId);
    var response = await _client.get(uri);
    var res = List<Album>();
    for (var item in json.decode(response.body)) res.add(Album.fromJson(item));
    return res;
  }

  /// Returns the `List` of `Photo` objects.
  ///
  /// When [albumId] is used; the list only contains the `Photo` objects with the given albumId.
  Future<List<Photo>> getPhotos({int albumId}) async {
    var uri = _getListUri(_ROUTE_POSTS, _QUERY_ALBUM_ID, albumId);
    var response = await _client.get(uri);
    var res = List<Photo>();
    for (var item in json.decode(response.body)) res.add(Photo.fromJson(item));
    return res;
  }

  /// Returns the `List` of `Todo` objects.
  ///
  /// When [userId] is used; the list only contains the `Todo` objects with the given userId.
  Future<List<Todo>> getTodos({int userId}) async {
    var uri = _getListUri(_ROUTE_POSTS, _QUERY_USER_ID, userId);
    var response = await _client.get(uri);
    var res = List<Todo>();
    for (var item in json.decode(response.body)) res.add(Todo.fromJson(item));
    return res;
  }

  /// Returns the `List` of `User` objects.
  Future<List<User>> getUsers() async {
    var uri = _getListUri(_ROUTE_USERS);
    var response = await _client.get(uri);
    var res = List<User>();
    for (var item in json.decode(response.body)) res.add(User.fromJson(item));
    return res;
  }

  /// Makes a delete request with the route and id.
  /// Returns the status code of the delete request.
  ///
  Future<int> _delete(String route, int id) async {
    var uri = Uri.https(_BASE_URL, '$route/$id');
    var response = await _client.delete(uri);
    return response.statusCode;
  }

  /// Deletes the `Todo` object with the given [id].
  ///
  /// Returns true if the request is successful.
  Future<bool> deleteTodo({@required int id}) async =>
      (await _delete(_ROUTE_TODOS, id)) == 200;

  /// Deletes the `User` object with the given [id].
  ///
  /// Returns true if the request is successful.
  Future<bool> deleteUser({@required int id}) async =>
      (await _delete(_ROUTE_USERS, id)) == 200;

  /// Deletes the `Comment` object with the given [id].
  ///
  /// Returns true if the request is successful.
  Future<bool> deleteComment({@required int id}) async =>
      (await _delete(_ROUTE_COMMENTS, id)) == 200;

  /// Deletes the `Album` object with the given [id].
  ///
  /// Returns true if the request is successful.
  Future<bool> deleteAlbum({@required int id}) async =>
      (await _delete(_ROUTE_ALBUMS, id)) == 200;

  /// Deletes the `Photo` object with the given [id].
  ///
  /// Returns true if the request is successful.
  Future<bool> deletePhoto({@required int id}) async =>
      (await _delete(_ROUTE_PHOTOS, id)) == 200;

  /// Deletes the `Post` object with the given [id].
  ///
  /// Returns true if the request is successful.
  Future<bool> deletePost({@required int id}) async =>
      (await _delete(_ROUTE_POSTS, id)) == 200;

  /// POSTs the given [Model] object to the given [route],
  ///
  /// Returns the `http.Response` of the request.
  Future<http.Response> _post(Model item, String route) async =>
      await _client.post(
        Uri.https(_BASE_URL, route),
        body: json.encode(item),
        headers: {"Content-type": "application/json; charset=UTF-8"},
      );

  /// POSTs the given `Post` object.
  ///
  /// Returns the created object from the server.
  Future<Post> postPost(Post post) async {
    var response = await _post(post, _ROUTE_POSTS);
    return Post.fromJson(json.decode(response.body));
  }

  /// POSTs the given `Comment` object.
  ///
  /// Returns the created object from the server.
  Future<Comment> postComment(Comment comment) async {
    var response = await _post(comment, _ROUTE_COMMENTS);
    return Comment.fromJson(json.decode(response.body));
  }

  /// POSTs the given `Album` object.
  ///
  /// Returns the created object from the server.
  Future<Album> postAlbum(Album album) async {
    var response = await _post(album, _ROUTE_ALBUMS);
    return Album.fromJson(json.decode(response.body));
  }

  /// POSTs the given `Photo` object.
  ///
  /// Returns the created object from the server.
  Future<Photo> postPhoto(Photo photo) async {
    var response = await _post(photo, _ROUTE_PHOTOS);
    return Photo.fromJson(json.decode(response.body));
  }

  /// POSTs the given `Todo` object.
  ///
  /// Returns the created object from the server.
  Future<Todo> postTodo(Todo todo) async {
    var response = await _post(todo, _ROUTE_TODOS);
    return Todo.fromJson(json.decode(response.body));
  }

  /// POSTs the given `User` object.
  ///
  /// Returns the created object from the server.
  Future<User> postUser(User user) async {
    var response = await _post(user, _ROUTE_USERS);
    return User.fromJson(json.decode(response.body));
  }

  /// PATCHes the given [Model] object to the given [route],
  ///
  /// Returns the `http.Response` of the request.
  Future<http.Response> _patch(Model item, String route) async =>
      await _client.patch(
        Uri.https(_BASE_URL, '$route/${item.id}'),
        body: json.encode(item),
        headers: {"Content-type": "application/json; charset=UTF-8"},
      );

  /// PATCHes the given `User` object.
  ///
  /// Returns the patched object from the server.
  Future<Post> patchPost(Post post) async {
    var response = await _patch(post, _ROUTE_POSTS);
    return Post.fromJson(json.decode(response.body));
  }

  /// PATCHes the given `User` object.
  ///
  /// Returns the patched object from the server.
  Future<Comment> patchComment(Comment comment) async {
    var response = await _patch(comment, _ROUTE_COMMENTS);
    return Comment.fromJson(json.decode(response.body));
  }

  /// PATCHes the given `User` object.
  ///
  /// Returns the patched object from the server.
  Future<Album> patchAlbum(Album album) async {
    var response = await _patch(album, _ROUTE_ALBUMS);
    return Album.fromJson(json.decode(response.body));
  }

  /// PATCHes the given `User` object.
  ///
  /// Returns the patched object from the server.
  Future<Photo> patchPhoto(Photo photo) async {
    var response = await _patch(photo, _ROUTE_PHOTOS);
    return Photo.fromJson(json.decode(response.body));
  }

  /// PATCHes the given `User` object.
  ///
  /// Returns the patched object from the server.
  Future<Todo> patchTodo(Todo todo) async {
    var response = await _patch(todo, _ROUTE_TODOS);
    return Todo.fromJson(json.decode(response.body));
  }

  /// PATCHes the given `User` object.
  ///
  /// Returns the patched object from the server.
  Future<User> patchUser(User user) async {
    var response = await _patch(user, _ROUTE_USERS);
    return User.fromJson(json.decode(response.body));
  }
}
