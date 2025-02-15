import 'package:equatable/equatable.dart';
import 'package:online_exam/domain/entities/auth/sign_up/user_entity.dart';

class SignUpResponseEntity extends Equatable {
  final String? message;
  final String? token;
  final UserEntity? user;

  const SignUpResponseEntity({
    this.message,
    this.token,
    this.user,
  });

  SignUpResponseEntity copyWith({
    String? message,
    String? token,
    UserEntity? user,
  }) {
    return SignUpResponseEntity(
      message: message ?? this.message,
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [message, token, user];
}
