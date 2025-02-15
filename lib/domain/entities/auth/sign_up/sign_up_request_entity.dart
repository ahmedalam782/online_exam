import 'package:equatable/equatable.dart';
import 'package:online_exam/data/models/auth/sign_up_request/sign_up_request.dart';

class SignUpRequestEntity extends Equatable {
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? rePassword;
  final String? phone;

  const SignUpRequestEntity({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });

  SignUpRequestEntity copyWith({
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? rePassword,
    String? phone,
  }) {
    return SignUpRequestEntity(
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
      phone: phone ?? this.phone,
    );
  }

  @override
  List<Object?> get props {
    return [
      username,
      firstName,
      lastName,
      email,
      password,
      rePassword,
      phone,
    ];
  }

  SignUpRequest toModel() => SignUpRequest(
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone,
      );
}
