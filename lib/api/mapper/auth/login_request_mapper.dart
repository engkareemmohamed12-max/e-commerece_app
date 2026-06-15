import 'package:e_commerece_app/api/models/request/auth/login/login_request_dto.dart';
import 'package:e_commerece_app/domain/entities/request/auth/login/login_request.dart';

extension LoginRequestMapper on LoginRequest{
  LoginRequestDto toLoginRequestDto(){
    return LoginRequestDto(
      email: email,
      password: password
    );
  }
}