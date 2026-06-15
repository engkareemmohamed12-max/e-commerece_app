// todo : viewModel

import 'package:dio/dio.dart';
import 'package:e_commerece_app/core/exception/app_exceptions.dart';
import 'package:e_commerece_app/domain/entities/request/auth/login/login_request.dart';
import 'package:e_commerece_app/domain/entities/request/auth/register/register_request.dart';
import 'package:e_commerece_app/domain/use_cases/login_use_case.dart';
import 'package:e_commerece_app/domain/use_cases/register_use_case.dart';
import 'package:e_commerece_app/features/ui/auth/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/exception/app_exceptions.dart';


@injectable
class RegisterViewModel extends Cubit<AuthStates> {
  final RegisterUseCase _registerUseCase;
  RegisterViewModel(this._registerUseCase):super(AuthInitialState());


  Future<void> register({required String email , required String password , required String name ,
    required  String rePassword , required String phone}) async{

    try {
      emit(AuthLoadingState());
      RegisterRequest registerRequest = RegisterRequest(
        email: email,
        password: password,
        name: name,
        rePassword: rePassword,
        phone: phone
      );

      var authResponse = await _registerUseCase.invoke(registerRequest);
      emit(AuthSuccessState(authResponse: authResponse));
    }on DioException catch(e){
      String message = (e.error is AppExceptions) ?
      (e.error as AppExceptions).message : 'Something went wrong';
      emit(AuthErrorState(appExceptions: ServerException(message: message)));


    }on AppExceptions catch(e){
      emit(AuthErrorState(appExceptions: ServerException(message: e.message)));
    }

    catch(e){

      emit(AuthErrorState(appExceptions: UnexpectedException(message: e.toString())));
    }
  }

}


//todo: view       => object viewModel
//todo: viewModel  => object UseCase
//todo: UseCase    => object Repository
//todo: Repository => object Remote Ds
//todo: Remote Ds  => object Api Services



//todo: clean architecture layers :
// todo: Feature , Ui , Presentation layer => UI
// todo: 1- Feature : 1- view => ui ,
// todo:              2- ViewModel => state Management
/// ---------------------------------------------------------------------
// todo: 2- Domain : 1- Repository => Abstract ,
// todo:             2- UseCases => business logic ,
// todo:             3- Entities => Pure classes Models
/// ----------------------------------------------------------------
// todo: 3- Data :   1- Repository => Implementation ,
// todo:             2- dataSources => Abstract , Impl
// todo:             3- Model => data class
/// ------------------------------------------------------------------
/// todo: scenario 2 :
/// --------------------
// todo: 3- Data :   1- Repository => Implementation ,
// todo:             2- dataSources => Abstract
/// ------------------------------------------------------------------
// todo: 4- Api :    1- dataSources => Implementation ,
// todo:             2- model => data class
/// -------------------------------------------------------------------
/// 1- Api =>
///      1- Models => Api => Dto
///    *- Response , Request => optional
///    *- ApiServices => retrofit
///      ---------------------------------------------------
///  final  2- DataSource => Implementation
///            1- class implements Abstract Remote Ds Abstract
///            2- mappers
///    ------------------------------------------------------
/// 2- Domain =>
///      1- Entities => Pure Classes from Models
///         Response , Request => optional
///      2- Repository => Abstract
///         Abstract class => Abstract Method
///      3- UseCase => class => Function
///  *- UseCase => object Repository => Abstract
///  *- imports  => domain
///    -------------------------------------------------------
/// 3- Data =>
///      1- DataSources => remote , local
///         Abstract class => abstract method
///      2- Repository => Implementation
///         class implements Abstract Repository
///  *- Repository => object RemoteDs
///  *- imports => domain , data
///  -------------------------------------------------------------
///  4- ViewModel => hold data - handle logic
///      1- states
///      2- viewModel => object UseCase
///      3- function => logic
///     -----------------------------------------------------------
///  Dependency injection => injectable
///  --------------------------------------------------------------
///  5- View =>
///    1- object => viewModel => getIt<>()
///    2- Flutter bloc Widgets
///    3- Calling Method => object . function
///    -------------------------------------------------------------
///