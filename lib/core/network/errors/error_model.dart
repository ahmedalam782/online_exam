import 'package:online_exam/core/network/remote/end_point.dart';

class ErrorModel {
  final int? code;
  final String? message;

  const ErrorModel({
    this.code,
    this.message,
  });

  factory ErrorModel.fromMap(Map<String, dynamic> data) => ErrorModel(
        code: data[ApiKey.code] as int?,
        message: data[ApiKey.message] as String?,
      );
}
