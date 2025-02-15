import 'package:equatable/equatable.dart';
import 'package:online_exam/domain/entities/auth/sign_up/sign_up_request_entity.dart';

class SignUpRequest extends Equatable {
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? rePassword;
  final String? phone;

  const SignUpRequest({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
        'rePassword': rePassword,
        'phone': phone,
      };

  SignUpRequest copyWith({
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? rePassword,
    String? phone,
  }) {
    return SignUpRequest(
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
  SignUpRequestEntity toEntity() => SignUpRequestEntity(
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone,
      );
}
