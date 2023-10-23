// ignore: empty_constructor_bodies
import 'package:assignment1/model/user_name.dart';
import 'package:assignment1/services/user_dob.dart';
import 'package:assignment1/services/user_picture.dart';

class User {
  final String cell;
  final UserName name;
  final String gender;
  final String email;
  final String phone;
  final String nat;
  final UserDob dob;
  final UserPicture pic;

  User({
    required this.cell,
    required this.name,
    required this.gender,
    required this.email,
    required this.phone,
    required this.nat,
    required this.dob,
    required this.pic,
  });

  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName.fromMap(e['name']);
    final dob = UserDob.fromMap(e['dob']);
    final image = UserPicture.fromMap(e['picture']);

    return User(
      cell: e['cell'],
      email: e['email'],
      phone: e['phone'],
      nat: e['nat'],
      gender: e['gender'],
      name: name,
      dob: dob,
      pic: image,
    );
  }

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
