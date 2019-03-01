class Geo {
  static const _KEY_LAT = "lat";
  static const _KEY_LNG = "lng";

  String lat;
  String lng;

  Geo(
    this.lat,
    this.lng,
  );

  Geo.fromJson(Map<String, dynamic> map)
      : lat = map[_KEY_LAT],
        lng = map[_KEY_LNG];

  Map<String, dynamic> toJson() => {
        _KEY_LAT: lat,
        _KEY_LNG: lng,
      };

  @override
  String toString() => toJson().toString();
}
