
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/network/remote/api_consumer.dart';
import 'package:online_exam/core/network/remote/end_point.dart';
import 'package:online_exam/data/data_sources/auth/remote/forget_password_data_source.dart';
import 'package:online_exam/data/models/auth/Request/ForgetPasswordRequest.dart';
import 'package:online_exam/data/models/auth/Response/ForgetPasswordResponse.dart';

@Injectable(as: ForgetPasswordDataSource)

 class ForgetPasswordDataSourceImpl implements ForgetPasswordDataSource{
  final ApiConsumer _apiConsumer;
  const ForgetPasswordDataSourceImpl(this._apiConsumer);

  @override
  Future<ForgetPasswordResponse> sendEmail(ForgetPasswordRequest forgetPasswordRequest)async {
    final response = await _apiConsumer.post(
      EndPoint.forgotPassword,
      data: forgetPasswordRequest.toJson()
    );
    return ForgetPasswordResponse.fromJson(response);
  }

}

