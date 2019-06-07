import 'dart:convert';

import 'package:http/http.dart';
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

  Uri _getListUrl(String route, [String queryKey, Object queryValue]) =>
      (queryValue == null)
          ? Uri.https(_BASE_URL, route)
          : Uri.https(
              _BASE_URL,
              route,
              {queryKey: queryValue.toString()},
            );

  Future<BuiltList<Album>> getAlbums({int userId}) async {
    var url = _getListUrl(_ROUTE_ALBUMS, _QUERY_USER_ID, userId);
    var response = await _client.get(url);
    return serializers.deserialize(
      json.decode(response.body),
      specifiedType: getListType(Album),
    );
  }

  Future<BuiltList<Comment>> getComments({int postId}) async {
    var url = _getListUrl(_ROUTE_COMMENTS, _QUERY_POST_ID, postId);
    var response = await _client.get(url);
    return serializers.deserialize(
      json.decode(response.body),
      specifiedType: getListType(Comment),
    );
  }

  Future<BuiltList<Photo>> getPhotos({int albumId}) async {
    var url = _getListUrl(_ROUTE_PHOTOS, _QUERY_ALBUM_ID, albumId);
    var response = await _client.get(url);
    return serializers.deserialize(
      json.decode(response.body),
      specifiedType: getListType(Photo),
    );
  }

  Future<BuiltList<Post>> getPosts({int userId}) async {
    var url = _getListUrl(_ROUTE_POSTS, _QUERY_USER_ID, userId);
    var response = await _client.get(url);
    return serializers.deserialize(
      json.decode(response.body),
      specifiedType: getListType(Post),
    );
  }

  Future<BuiltList<Todo>> getTodos({int userId}) async {
    var url = _getListUrl(_ROUTE_TODOS, _QUERY_USER_ID, userId);
    var response = await _client.get(url);
    return serializers.deserialize(
      json.decode(response.body),
      specifiedType: getListType(Todo),
    );
  }

  Future<BuiltList<User>> getUsers() async {
    var url = _getListUrl(_ROUTE_USERS);
    var response = await _client.get(url);
    return serializers.deserialize(
      json.decode(response.body),
      specifiedType: getListType(User),
    );
  }

  Uri _getSingleUrl(String route, int id) => Uri.https(_BASE_URL, "$route/$id");

  Future<Album> getAlbum(int id) async {
    var url = _getSingleUrl(_ROUTE_ALBUMS, id);
    var response = await _client.get(url);
    return Album.fromJson(response.body);
  }

  Future<Comment> getComment(int id) async {
    var url = _getSingleUrl(_ROUTE_COMMENTS, id);
    var response = await _client.get(url);
    return Comment.fromJson(response.body);
  }

  Future<Photo> getPhoto(int id) async {
    var url = _getSingleUrl(_ROUTE_PHOTOS, id);
    var response = await _client.get(url);
    return Photo.fromJson(response.body);
  }

  Future<Post> getPost(int id) async {
    var url = _getSingleUrl(_ROUTE_POSTS, id);
    var response = await _client.get(url);
    return Post.fromJson(response.body);
  }

  Future<Todo> getTodo(int id) async {
    var url = _getSingleUrl(_ROUTE_TODOS, id);
    var response = await _client.get(url);
    return Todo.fromJson(response.body);
  }

  Future<User> getUser(int id) async {
    var url = _getSingleUrl(_ROUTE_USERS, id);
    var response = await _client.get(url);
    return User.fromJson(response.body);
  }

  Future<Response> _post(String body, String route) async => _client.post(
        Uri.https(_BASE_URL, route),
        body: body,
        headers: {"Content-type": "application/json; charset=UTF-8"},
      );

  Future<Album> postAlbum(Album album) async {
    var response = await _post(album.toJson(), _ROUTE_ALBUMS);
    return Album.fromJson(response.body);
  }

  Future<Comment> postComment(Comment comment) async {
    var response = await _post(comment.toJson(), _ROUTE_COMMENTS);
    return Comment.fromJson(response.body);
  }

  Future<Photo> postPhoto(Photo photo) async {
    var response = await _post(photo.toJson(), _ROUTE_PHOTOS);
    return Photo.fromJson(response.body);
  }

  Future<Post> postPost(Post post) async {
    var response = await _post(post.toJson(), _ROUTE_POSTS);
    return Post.fromJson(response.body);
  }

  Future<Todo> postTodo(Todo todo) async {
    var response = await _post(todo.toJson(), _ROUTE_TODOS);
    return Todo.fromJson(response.body);
  }

  Future<User> postUser(User user) async {
    var response = await _post(user.toJson(), _ROUTE_USERS);
    return User.fromJson(response.body);
  }

  Future<Response> _put(String body, String route, int id) async => _client.put(
        Uri.https(_BASE_URL, "$route/$id"),
        body: body,
        headers: {"Content-type": "application/json; charset=UTF-8"},
      );

  Future<Album> updateAlbum(Album album) async {
    var response = await _put(album.toJson(), _ROUTE_ALBUMS, album.id);
    return Album.fromJson(response.body);
  }

  Future<Comment> updateComment(Comment comment) async {
    var response = await _put(comment.toJson(), _ROUTE_COMMENTS, comment.id);
    return Comment.fromJson(response.body);
  }

  Future<Photo> updatePhoto(Photo photo) async {
    var response = await _put(photo.toJson(), _ROUTE_PHOTOS, photo.id);
    return Photo.fromJson(response.body);
  }

  Future<Post> updatePost(Post post) async {
    var response = await _put(post.toJson(), _ROUTE_POSTS, post.id);
    return Post.fromJson(response.body);
  }

  Future<Todo> updateTodo(Todo todo) async {
    var response = await _put(todo.toJson(), _ROUTE_TODOS, todo.id);
    return Todo.fromJson(response.body);
  }

  Future<User> updateUser(User user) async {
    var response = await _put(user.toJson(), _ROUTE_USERS, user.id);
    return User.fromJson(response.body);
  }

  void _delete(String route, int id) async =>
      await _client.delete(Uri.https(_BASE_URL, '$route/$id'));

  void deleteAlbum(Album album) async => await _delete(
        _ROUTE_ALBUMS,
        album.id,
      );

  void deleteComment(Comment comment) async => await _delete(
        _ROUTE_COMMENTS,
        comment.id,
      );

  void deletePhoto(Photo photo) async => await _delete(
        _ROUTE_PHOTOS,
        photo.id,
      );

  void deletePost(Post post) async => await _delete(
        _ROUTE_POSTS,
        post.id,
      );

  void deleteTodo(Todo todo) async => await _delete(
        _ROUTE_TODOS,
        todo.id,
      );

  void deleteUser(User user) async => await _delete(
        _ROUTE_USERS,
        user.id,
      );
}
