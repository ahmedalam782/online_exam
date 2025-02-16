import 'package:equatable/equatable.dart';

import '../../../../domain/entities/auth/forget_password_request_entity.dart';

sealed class AuthIntent extends Equatable {}

class ForgetPasswordIntent extends AuthIntent {
  final ForgetPasswordRequestEntity forgetPasswordRequestEntity;
  ForgetPasswordIntent({required this.forgetPasswordRequestEntity});

  @override
  List<Object?> get props => [forgetPasswordRequestEntity];
}