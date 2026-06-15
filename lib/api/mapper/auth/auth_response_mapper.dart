import 'package:e_commerece_app/api/mapper/auth/user_mapper.dart';
import 'package:e_commerece_app/api/models/response/auth/auth_response_dto.dart';
import 'package:e_commerece_app/domain/entities/response/auth/auth_response.dart';

extension AuthResponseMapper on AuthResponseDto{
  AuthResponse toAuthResponse(){
    return AuthResponse(
      message: message ,
      token: token ,
      user: user?.toUser()
    );
  }
}