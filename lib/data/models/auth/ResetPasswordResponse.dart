import 'package:equatable/equatable.dart';

/// message : "reset code not verified"
/// code : 400

class ResetPasswordResponse extends Equatable {
  ResetPasswordResponse({
      this.message, 
      this.code,});

  ResetPasswordResponse.fromJson(dynamic json) {
    message = json['message'];
    code = json['code'];
  }
  String? message;
  int? code;
ResetPasswordResponse copyWith({  String? message,
  int? code,
}) => ResetPasswordResponse(  message: message ?? this.message,
  code: code ?? this.code,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['code'] = code;
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];

}