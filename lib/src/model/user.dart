library user;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jsonplaceholder/src/model/address.dart';
import 'package:jsonplaceholder/src/model/company.dart';
import 'package:jsonplaceholder/src/model/serializers.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {
  User._();

  factory User([updates(UserBuilder b)]) = _$User;

  @nullable
  int get id;
  String get name;
  String get username;
  String get email;
  Address get address;
  String get phone;
  String get website;
  Company get company;

  String toJson() =>
      json.encode(serializers.serializeWith(User.serializer, this));

  static User fromJson(String jsonString) =>
      serializers.deserializeWith(User.serializer, json.decode(jsonString));

  static Serializer<User> get serializer => _$userSerializer;
}
