class Company {
  static const _KEY_NAME = "name";
  static const _KEY_CATCH_PHRASE = "catchPhrase";
  static const _KEY_BS = "bs";

  String name;
  String catchPhrase;
  String bs;

  Company(
    this.name,
    this.catchPhrase,
    this.bs,
  );

  Company.fromJson(Map<String, dynamic> map)
      : name = map[_KEY_NAME],
        catchPhrase = map[_KEY_CATCH_PHRASE],
        bs = map[_KEY_BS];

  Map<String, dynamic> toJson() => {
        _KEY_NAME: name,
        _KEY_CATCH_PHRASE: catchPhrase,
        _KEY_BS: bs,
      };

  @override
  String toString() => toJson().toString();
}
