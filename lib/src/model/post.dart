library post;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jsonplaceholder/src/model/serializers.dart';

part 'post.g.dart';

abstract class Post implements Built<Post, PostBuilder> {
  Post._();

  factory Post([updates(PostBuilder b)]) = _$Post;

  @nullable
  int get id;
  int get userId;
  String get title;
  String get body;

  String toJson() =>
      json.encode(serializers.serializeWith(Post.serializer, this));

  static Post fromJson(String jsonString) =>
      serializers.deserializeWith(Post.serializer, json.decode(jsonString));

  static Serializer<Post> get serializer => _$postSerializer;
}
