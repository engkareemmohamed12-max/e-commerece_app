import 'package:e_commerece_app/api/models/request/auth/register/register_request_dto.dart';
import 'package:e_commerece_app/domain/entities/request/auth/register/register_request.dart';

extension RegisterMapper on RegisterRequest{
  RegisterRequestDto toRegisterRequestDto(){
    return RegisterRequestDto(
      name: name,
      email: email,
      password: password,
      phone: phone,
      rePassword: rePassword
    );
  }
}