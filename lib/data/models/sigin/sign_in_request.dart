import 'package:equatable/equatable.dart';
import 'package:online_exam/domain/entities/auth/sign_up/sign_up_request_entity.dart';

import '../../../domain/entities/auth/sign_in/sign_in_request_entity.dart';

class SignInRequest extends Equatable {
  final String? email;
  final String? password;

  const SignInRequest({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };

  SignInRequest copyWith({
    String? email,
    String? password,
  }) {
    return SignInRequest(
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
  SignInRequestEntity toEntity() => SignInRequestEntity(email: email, password: password,);
}
