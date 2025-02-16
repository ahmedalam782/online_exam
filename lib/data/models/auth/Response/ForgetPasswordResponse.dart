import 'package:equatable/equatable.dart';

import '../../../../domain/entities/auth/forget_password_response_entity.dart';

/// message : "success"
/// info : "OTP sent to your email"

class ForgetPasswordResponse extends Equatable {
  ForgetPasswordResponse({
    this.message,
    this.info,
    this.code,
  });

  ForgetPasswordResponse.fromJson(dynamic json) {
    message = json['message'];
    info = json['info'];
    code = json['code'];

  }
  String? message;
  String? info;
  String? code;

  ForgetPasswordResponse copyWith({
    String? message,
    String? info,
    String? code
  }) =>
      ForgetPasswordResponse(
        message: message ?? this.message,
        info: info ?? this.info,
        code: info ?? this.code,

      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['info'] = info;
    map['code'] = code;

    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];

  ForgetPasswordResponseEntity toEntity() => ForgetPasswordResponseEntity(
    message: message,
    info: info,
    code: code,

  );
}
