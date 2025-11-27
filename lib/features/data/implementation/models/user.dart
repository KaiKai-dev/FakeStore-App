import 'package:fakestore/features/domain/models/user.dart';

class User extends UserModel {
  User({
    required super.id, 
    required super.firstname, 
    required super.lastname,
    super.nickname,
    super.age
  });

  factory User.fromJson(Map<String, dynamic> data) => User(
    id: data["id"], 
    firstname: data["firstname"], 
    lastname: data["lastname"]
  );

}