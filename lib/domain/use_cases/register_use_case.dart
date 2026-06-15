import 'package:e_commerece_app/domain/entities/request/auth/register/register_request.dart';
import 'package:e_commerece_app/domain/entities/response/auth/auth_response.dart';
import 'package:e_commerece_app/domain/repositories/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';


@injectable
class RegisterUseCase {
  final AuthRepository _authRepository ;
  RegisterUseCase(this._authRepository);

  Future<AuthResponse>invoke(RegisterRequest registerRequest){
   return _authRepository.register(registerRequest);
  }
}