import 'package:equatable/equatable.dart';
import 'package:online_exam/domain/entities/auth/sign_up/sign_up_request_entity.dart';

sealed class AuthIntent extends Equatable {}

class SignUpIntent extends AuthIntent {
  final SignUpRequestEntity signUpRequestEntity;
  SignUpIntent({required this.signUpRequestEntity});

  @override
  List<Object?> get props => [signUpRequestEntity];
}
