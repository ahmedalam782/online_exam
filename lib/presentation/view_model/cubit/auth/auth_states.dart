import 'package:equatable/equatable.dart';
import 'package:online_exam/domain/entities/auth/sign_up/sign_up_response_entity.dart';

sealed class AuthStates extends Equatable {}

class AuthInitialState extends AuthStates {
  @override
  List<Object?> get props => [];
}

class SignUpLoadingState extends AuthStates {
  @override
  List<Object?> get props => [];
}

class SignUpSuccessState extends AuthStates {
  final SignUpResponseEntity signUpResponseEntity;
  SignUpSuccessState({required this.signUpResponseEntity});
  
  @override
  List<Object?> get props => [signUpResponseEntity];
}

class SignUpErrorState extends AuthStates {
  final  Exception? exception;
  SignUpErrorState({required this.exception});
  
  @override
  List<Object?> get props => [exception];
}
