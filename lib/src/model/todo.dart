library todo;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jsonplaceholder/src/model/serializers.dart';

part 'todo.g.dart';

abstract class Todo implements Built<Todo, TodoBuilder> {
  Todo._();

  factory Todo([updates(TodoBuilder b)]) = _$Todo;

  @nullable
  int get id;
  int get userId;
  String get title;
  bool get completed;

  String toJson() =>
      json.encode(serializers.serializeWith(Todo.serializer, this));

  static Todo fromJson(String jsonString) =>
      serializers.deserializeWith(Todo.serializer, json.decode(jsonString));

  static Serializer<Todo> get serializer => _$todoSerializer;
}
