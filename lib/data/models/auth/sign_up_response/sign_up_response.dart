import 'package:equatable/equatable.dart';
import 'package:online_exam/domain/entities/auth/sign_up/sign_up_response_entity.dart';

import 'user.dart';

class SignUpResponse extends Equatable {
  final String? message;
  final String? token;
  final User? user;

  const SignUpResponse({this.message, this.token, this.user});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  SignUpResponse copyWith({
    String? message,
    String? token,
    User? user,
  }) {
    return SignUpResponse(
      message: message ?? this.message,
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [message, token, user];

  SignUpResponseEntity toEntity() => SignUpResponseEntity(
        message: message,
        token: token,
        user: user?.toEntity(),
      );
}
