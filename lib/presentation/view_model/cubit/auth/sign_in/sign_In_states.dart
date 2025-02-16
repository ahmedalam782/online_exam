import 'package:equatable/equatable.dart';
import 'package:online_exam/domain/entities/auth/sign_up/sign_up_response_entity.dart';
import '../../../../../domain/entities/auth/sign_in/sign_in_response_entity.dart';
sealed class SignInStates extends Equatable {}

class SignInInitialState extends SignInStates {
  @override
  List<Object?> get props => [];
}



class SignInLoadingState extends SignInStates {
  @override
  List<Object?> get props => [];
}

class SignInSuccessState extends SignInStates {
  final SignInResponseEntity signInResponseEntity;
  SignInSuccessState({required this.signInResponseEntity});
  @override
  List<Object?> get props => [signInResponseEntity];
}

class SignInErrorState extends SignInStates {
  final  Exception? exception;
  SignInErrorState({required this.exception});
  @override
  List<Object?> get props => [exception];
}