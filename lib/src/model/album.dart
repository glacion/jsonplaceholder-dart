library album;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jsonplaceholder/src/model/serializers.dart';

part 'album.g.dart';

abstract class Album implements Built<Album, AlbumBuilder> {
  Album._();

  factory Album([updates(AlbumBuilder b)]) = _$Album;

  @BuiltValueField(wireName: 'userId')
  int get userId;
  @BuiltValueField(wireName: 'id')
  int get id;
  @BuiltValueField(wireName: 'title')
  String get title;
  String toJson() {
    return json.encode(serializers.serializeWith(Album.serializer, this));
  }

  static Album fromJson(String jsonString) {
    return serializers.deserializeWith(
        Album.serializer, json.decode(jsonString));
  }

  static Serializer<Album> get serializer => _$albumSerializer;
}
