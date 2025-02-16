import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/presentation/view_model/cubit/auth/auth_states.dart';

import '../../../../domain/common/result.dart';
import '../../../../domain/entities/auth/forget_password_request_entity.dart';
import '../../../../domain/use_caes/auth/forget_password_usecase.dart';
import 'auth_Intent.dart';

@injectable
class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this._sendEmailCall) : super(ForgetPasswordInitialState());
  final ForgetPasswordUseCase _sendEmailCall;
  static AuthCubit get(context) => BlocProvider.of(context);

  void _sendEmail(
      ForgetPasswordRequestEntity forgetPasswordRequestEntity) async {
    emit(ForgetPasswordLoadingState());
    final result = await _sendEmailCall(forgetPasswordRequestEntity);
    switch (result) {
      case Success():
        {
          emit(ForgetPasswordSuccessState(
            forgetPasswordSuccessState: result.data!,
          ));
        }
      case Error():
        {
          emit(ForgetPasswordErrorState(
            exception: result.exception!,
          ));
        }
    }
  }

  void doIntent(AuthIntent authIntent) {
    switch (authIntent) {
      case ForgetPasswordIntent():
        {
          _sendEmail(authIntent.forgetPasswordRequestEntity);
        }
    }
  }
}
