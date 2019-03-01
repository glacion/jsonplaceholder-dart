import 'package:jsonplaceholder/src/model/user/address.dart';
import 'package:jsonplaceholder/src/model/user/company.dart';
import 'package:jsonplaceholder/src/model/model.dart';

class User extends Model {
  static const _KEY_ID = "id";
  static const _KEY_NAME = "name";
  static const _KEY_USERNAME = "username";
  static const _KEY_EMAIL = "email";
  static const _KEY_ADDRESS = "address";
  static const _KEY_PHONE = "phone";
  static const _KEY_WEBSITE = "website";
  static const _KEY_COMPANY = "company";

  final int _id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  User(
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company, [
    this._id,
  ]);

  User.fromJson(Map<String, dynamic> map)
      : _id = map[_KEY_ID],
        name = map[_KEY_NAME],
        username = map[_KEY_USERNAME],
        email = map[_KEY_EMAIL],
        address = Address.fromJson(map[_KEY_ADDRESS]),
        phone = map[_KEY_PHONE],
        website = map[_KEY_WEBSITE],
        company = Company.fromJson(map[_KEY_COMPANY]);

  @override
  Map<String, dynamic> toJson() => {
        _KEY_ID: _id,
        _KEY_NAME: name,
        _KEY_USERNAME: username,
        _KEY_EMAIL: email,
        _KEY_ADDRESS: address.toJson(),
        _KEY_PHONE: phone,
        _KEY_WEBSITE: website,
        _KEY_COMPANY: company.toJson(),
      };

  @override
  int get id => _id;

  @override
  String toString() => toJson().toString();
}
