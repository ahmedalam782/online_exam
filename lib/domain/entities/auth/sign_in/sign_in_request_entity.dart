import 'package:equatable/equatable.dart';
import 'package:online_exam/data/models/auth/sign_up_request/sign_up_request.dart';

import '../../../../data/models/sigin/sign_in_request.dart';

class SignInRequestEntity extends Equatable {
  final String? email;
  final String? password;

  const SignInRequestEntity({
    this.email,
    this.password,
  });

  SignInRequestEntity copyWith({
    String? email,
    String? password,
  }) {
    return SignInRequestEntity(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props {
    return [
      email,
      password,
    ];
  }

  SignInRequest toModel() => SignInRequest(
        email: email,
        password: password,
      );
}
