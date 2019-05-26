library company;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:jsonplaceholder/src/model/serializers.dart';

part 'company.g.dart';

abstract class Company implements Built<Company, CompanyBuilder> {
  Company._();

  factory Company([updates(CompanyBuilder b)]) = _$Company;

  String get name;
  String get catchPhrase;
  String get bs;

  String toJson() =>
      json.encode(serializers.serializeWith(Company.serializer, this));

  static Company fromJson(String jsonString) =>
      serializers.deserializeWith(Company.serializer, json.decode(jsonString));

  static Serializer<Company> get serializer => _$companySerializer;
}
