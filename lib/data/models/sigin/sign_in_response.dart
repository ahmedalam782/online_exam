import 'package:equatable/equatable.dart';
import 'package:online_exam/domain/entities/auth/sign_up/sign_up_response_entity.dart';
import '../../../domain/entities/auth/sign_in/sign_in_response_entity.dart';
import '../auth/sign_up_response/user.dart';

class SignInResponse extends Equatable {
  final String? message;
  final String? token;
  final User? user;

  const SignInResponse({this.message, this.token, this.user});

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  SignInResponse copyWith({
    String? message,
    String? token,
    User? user,
  }) {
    return SignInResponse(
      message: message ?? this.message,
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [message, token, user];

  SignInResponseEntity toEntity() => SignInResponseEntity(
        message: message,
        token: token,
        user: user?.toEntity(),
      );
}
