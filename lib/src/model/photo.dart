library photo;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jsonplaceholder/src/model/serializers.dart';

part 'photo.g.dart';

abstract class Photo implements Built<Photo, PhotoBuilder> {
  Photo._();

  factory Photo([updates(PhotoBuilder b)]) = _$Photo;

  @nullable
  int get id;
  int get albumId;
  String get title;
  String get url;
  String get thumbnailUrl;

  String toJson() =>
      json.encode(serializers.serializeWith(Photo.serializer, this));

  static Photo fromJson(String jsonString) =>
      serializers.deserializeWith(Photo.serializer, json.decode(jsonString));

  static Serializer<Photo> get serializer => _$photoSerializer;
}
