import 'package:equatable/equatable.dart';

import '../../../../domain/entities/auth/forget_password_response_entity.dart';

sealed class AuthStates extends Equatable{

}

class ForgetPasswordInitialState extends AuthStates{
  @override
  List<Object?> get props => [];
}

class ForgetPasswordLoadingState extends AuthStates{
 @override
 List<Object?> get props => [];
}

class ForgetPasswordSuccessState extends AuthStates{
  final ForgetPasswordResponseEntity forgetPasswordSuccessState;
  ForgetPasswordSuccessState({required this.forgetPasswordSuccessState});

 @override
 List<Object?> get props => [];
}


class ForgetPasswordErrorState extends AuthStates{
 final Exception? exception;
 ForgetPasswordErrorState({required this.exception});
 @override
 List<Object?> get props => [];


}