import 'package:equatable/equatable.dart';

import '../../../data/models/auth/Request/ForgetPasswordRequest.dart';

class ForgetPasswordRequestEntity extends Equatable {
  final String? email;

  const ForgetPasswordRequestEntity(this.email);

  ForgetPasswordRequestEntity copyWith({
    String? email,
  }) {
    return ForgetPasswordRequestEntity(email ?? this.email);
  }

  @override
  List<Object?> get props {
    return [email];
  }

  ForgetPasswordRequest toModel() => ForgetPasswordRequest(
    email: email,

  );
}
