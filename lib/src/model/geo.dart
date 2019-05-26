library geo;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jsonplaceholder/src/model/serializers.dart';

part 'geo.g.dart';

abstract class Geo implements Built<Geo, GeoBuilder> {
  Geo._();

  factory Geo([updates(GeoBuilder b)]) = _$Geo;

  String get lat;
  String get lng;

  String toJson() =>
      json.encode(serializers.serializeWith(Geo.serializer, this));

  static Geo fromJson(String jsonString) =>
      serializers.deserializeWith(Geo.serializer, json.decode(jsonString));

  static Serializer<Geo> get serializer => _$geoSerializer;
}
