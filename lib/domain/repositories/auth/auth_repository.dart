// todo : auth repository => interface

import 'package:e_commerece_app/domain/entities/request/auth/login/login_request.dart';
import 'package:e_commerece_app/domain/entities/request/auth/register/register_request.dart';
import 'package:e_commerece_app/domain/entities/response/auth/auth_response.dart';

abstract class AuthRepository {

  Future<AuthResponse>login(LoginRequest loginRequest);

  Future<AuthResponse>register(RegisterRequest registerRequest);
}