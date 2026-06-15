// todo auth remote ds => impl

import 'package:e_commerece_app/api/api_services.dart';
import 'package:e_commerece_app/api/mapper/auth/auth_response_mapper.dart';
import 'package:e_commerece_app/api/mapper/auth/login_request_mapper.dart';
import 'package:e_commerece_app/api/mapper/auth/register_mapper.dart';
import 'package:e_commerece_app/data/data_sources/remote/auth/auth_remote_data_source.dart';
import 'package:e_commerece_app/domain/entities/request/auth/login/login_request.dart';
import 'package:e_commerece_app/domain/entities/request/auth/register/register_request.dart';
import 'package:e_commerece_app/domain/entities/response/auth/auth_response.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiServices _apiServices;
  AuthRemoteDataSourceImpl(this._apiServices);
  @override
  Future<AuthResponse> login(LoginRequest loginRequest) async{
    //todo : loginRequest => loginRequestDto
    var authResponse = await _apiServices.login(loginRequest.toLoginRequestDto());
    // todo : authResponseDto => authResponse
    return authResponse.toAuthResponse() ;
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) async{
    // todo : registerRequest => registerRequestDto
    var authResponse = await _apiServices.register(registerRequest.toRegisterRequestDto());
    // todo : authResponseDto => authResponse
    return authResponse.toAuthResponse();
  }
}