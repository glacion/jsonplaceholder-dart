library album;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jsonplaceholder/src/model/serializers.dart';

part 'album.g.dart';

abstract class Album implements Built<Album, AlbumBuilder> {
  Album._();

  factory Album([updates(AlbumBuilder b)]) = _$Album;

  int get userId;
  int get id;
  String get title;

  String toJson() =>
      json.encode(serializers.serializeWith(Album.serializer, this));

  static Album fromJson(String jsonString) =>
      serializers.deserializeWith(Album.serializer, json.decode(jsonString));

  static Serializer<Album> get serializer => _$albumSerializer;
}
