import 'package:equatable/equatable.dart';

import '../../../../domain/entities/auth/forget_password_request_entity.dart';

class ForgetPasswordRequest extends Equatable {
  final String? email;

  const ForgetPasswordRequest({
    this.email,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
      };

  ForgetPasswordRequest copyWith({
    String? email,
  }) {
    return ForgetPasswordRequest(
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props {
    return [email];
  }

  ForgetPasswordRequestEntity toEntity() => ForgetPasswordRequestEntity(email);
}
