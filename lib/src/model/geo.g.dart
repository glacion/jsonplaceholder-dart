// GENERATED CODE - DO NOT MODIFY BY HAND

part of geo;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Geo> _$geoSerializer = new _$GeoSerializer();

class _$GeoSerializer implements StructuredSerializer<Geo> {
  @override
  final Iterable<Type> types = const [Geo, _$Geo];
  @override
  final String wireName = 'Geo';

  @override
  Iterable serialize(Serializers serializers, Geo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'lat',
      serializers.serialize(object.lat, specifiedType: const FullType(String)),
      'lng',
      serializers.serialize(object.lng, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Geo deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GeoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'lat':
          result.lat = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lng':
          result.lng = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Geo extends Geo {
  @override
  final String lat;
  @override
  final String lng;

  factory _$Geo([void Function(GeoBuilder) updates]) =>
      (new GeoBuilder()..update(updates)).build();

  _$Geo._({this.lat, this.lng}) : super._() {
    if (lat == null) {
      throw new BuiltValueNullFieldError('Geo', 'lat');
    }
    if (lng == null) {
      throw new BuiltValueNullFieldError('Geo', 'lng');
    }
  }

  @override
  Geo rebuild(void Function(GeoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GeoBuilder toBuilder() => new GeoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Geo && lat == other.lat && lng == other.lng;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, lat.hashCode), lng.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Geo')
          ..add('lat', lat)
          ..add('lng', lng))
        .toString();
  }
}

class GeoBuilder implements Builder<Geo, GeoBuilder> {
  _$Geo _$v;

  String _lat;
  String get lat => _$this._lat;
  set lat(String lat) => _$this._lat = lat;

  String _lng;
  String get lng => _$this._lng;
  set lng(String lng) => _$this._lng = lng;

  GeoBuilder();

  GeoBuilder get _$this {
    if (_$v != null) {
      _lat = _$v.lat;
      _lng = _$v.lng;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Geo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Geo;
  }

  @override
  void update(void Function(GeoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Geo build() {
    final _$result = _$v ?? new _$Geo._(lat: lat, lng: lng);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
