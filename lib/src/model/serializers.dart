library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:jsonplaceholder/src/model/address.dart';
import 'package:jsonplaceholder/src/model/album.dart';
import 'package:jsonplaceholder/src/model/comment.dart';
import 'package:jsonplaceholder/src/model/company.dart';
import 'package:jsonplaceholder/src/model/geo.dart';
import 'package:jsonplaceholder/src/model/photo.dart';
import 'package:jsonplaceholder/src/model/post.dart';
import 'package:jsonplaceholder/src/model/todo.dart';
import 'package:jsonplaceholder/src/model/user.dart';

part 'serializers.g.dart';

FullType getListType(Type type) => FullType(
      BuiltList,
      [FullType(type)],
    );

@SerializersFor([
  Address,
  Album,
  Comment,
  Company,
  Geo,
  Photo,
  Post,
  Todo,
  User,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addBuilderFactory(getListType(Album), () => ListBuilder<Album>())
      ..addBuilderFactory(getListType(Comment), () => ListBuilder<Comment>())
      ..addBuilderFactory(getListType(Photo), () => ListBuilder<Photo>())
      ..addBuilderFactory(getListType(Post), () => ListBuilder<Post>())
      ..addBuilderFactory(getListType(Todo), () => ListBuilder<Todo>())
      ..addBuilderFactory(getListType(User), () => ListBuilder<User>()))
    .build();
