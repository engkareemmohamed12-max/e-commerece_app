import 'package:e_commerece_app/api/models/response/auth/user_dto.dart';
import 'package:e_commerece_app/domain/entities/response/auth/user.dart';

extension UserMapper on UserDto{
  User toUser(){
    return User(
      email: email,
      name: name
    );
  }
}