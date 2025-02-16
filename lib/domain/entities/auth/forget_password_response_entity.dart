import 'package:equatable/equatable.dart';

/// message : "success"
/// info : "OTP sent to your email"

class ForgetPasswordResponseEntity extends Equatable {
  String? message;
  String? info;
  String? code;
  ForgetPasswordResponseEntity({
    this.message,
    this.info,
    this.code,
  });


  ForgetPasswordResponseEntity copyWith({
    String? message,
    String? info,
    String? code
  }) =>
      ForgetPasswordResponseEntity(
        message: message ?? this.message,
        info: info ?? this.info,
        code: info ?? this.code,

      );

  @override
  // TODO: implement props
  List<Object?> get props => [message,info,code];

}
