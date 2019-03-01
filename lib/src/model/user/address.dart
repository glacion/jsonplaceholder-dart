import 'package:jsonplaceholder/src/model/user/geo.dart';

class Address {
  static const _KEY_STREET = "street";
  static const _KEY_SUITE = "suite";
  static const _KEY_CITY = "city";
  static const _KEY_ZIP_CODE = "zipcode";
  static const _KEY_GEO = "geo";

  String street;
  String suite;
  String city;
  String zipCode;
  Geo geo;

  Address(
    this.street,
    this.suite,
    this.city,
    this.zipCode,
    this.geo,
  );

  Address.fromJson(Map<String, dynamic> map)
      : street = map[_KEY_STREET],
        suite = map[_KEY_SUITE],
        city = map[_KEY_CITY],
        zipCode = map[_KEY_ZIP_CODE],
        geo = Geo.fromJson(map[_KEY_GEO]);

  Map<String, dynamic> toJson() => {
        _KEY_STREET: street,
        _KEY_SUITE: suite,
        _KEY_CITY: city,
        _KEY_ZIP_CODE: zipCode,
        _KEY_GEO: geo.toJson()
      };

  @override
  String toString() => toJson().toString();
}
