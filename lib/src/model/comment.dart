library comment;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jsonplaceholder/src/model/serializers.dart';

part 'comment.g.dart';

abstract class Comment implements Built<Comment, CommentBuilder> {
  Comment._();

  factory Comment([updates(CommentBuilder b)]) = _$Comment;

  @nullable
  int get id;
  int get postId;
  String get name;
  String get email;
  String get body;

  String toJson() =>
      json.encode(serializers.serializeWith(Comment.serializer, this));

  static Comment fromJson(String jsonString) =>
      serializers.deserializeWith(Comment.serializer, json.decode(jsonString));

  static Serializer<Comment> get serializer => _$commentSerializer;
}
