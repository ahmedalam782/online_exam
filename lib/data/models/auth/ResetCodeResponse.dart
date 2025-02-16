import 'package:equatable/equatable.dart';

/// message : "Reset code is invalid or has expired"
/// code : 400

class ResetCodeResponse extends Equatable {
  ResetCodeResponse({
      this.message, 
      this.code,});

  ResetCodeResponse.fromJson(dynamic json) {
    message = json['message'];
    code = json['code'];
  }
  String? message;
  int? code;
ResetCodeResponse copyWith({  String? message,
  int? code,
}) => ResetCodeResponse(  message: message ?? this.message,
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