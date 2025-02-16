import 'package:equatable/equatable.dart';
import 'package:online_exam/domain/entities/auth/sign_up/user_entity.dart';

class SignInResponseEntity extends Equatable {
  final String? message;
  final String? token;
  final UserEntity? user;

  const SignInResponseEntity({
    this.message,
    this.token,
    this.user,
  });

  SignInResponseEntity copyWith({
    String? message,
    String? token,
    UserEntity? user,
  }) {
    return SignInResponseEntity(
      message: message ?? this.message,
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [message, token, user];
}
