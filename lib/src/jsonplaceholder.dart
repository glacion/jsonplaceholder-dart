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
}
