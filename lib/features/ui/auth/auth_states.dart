import 'package:e_commerece_app/core/exception/app_exceptions.dart';
import 'package:e_commerece_app/domain/entities/response/auth/auth_response.dart';

sealed class AuthStates {}

class AuthInitialState extends AuthStates{}

class AuthLoadingState extends AuthStates{}

class AuthErrorState extends AuthStates{
  AppExceptions appExceptions ;
  AuthErrorState({required this.appExceptions});
}

class AuthSuccessState extends AuthStates{
  AuthResponse authResponse ;
  AuthSuccessState({required this.authResponse});
}