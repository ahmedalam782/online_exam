import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/common/result.dart';
import 'package:online_exam/domain/entities/auth/sign_up/sign_up_request_entity.dart';
import 'package:online_exam/domain/use_cases/auth/sign_up.dart';
import 'package:online_exam/presentation/view_model/cubit/auth/auth_intent.dart';
import 'package:online_exam/presentation/view_model/cubit/auth/auth_states.dart';

import '../../../../domain/entities/auth/sign_in/sign_in_request_entity.dart';
import '../../../../domain/use_cases/auth/sign_in.dart';

@injectable
class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(
    this._signUpCall,
  ) : super(AuthInitialState());
  final SignUp _signUpCall;

  static AuthCubit get(context) => BlocProvider.of(context);

  void _signUp(SignUpRequestEntity signUpRequestEntity) async {
    emit(SignUpLoadingState());
    final result = await _signUpCall(signUpRequestEntity);
    switch (result) {
      case Success():
        {
          emit(SignUpSuccessState(
            signUpResponseEntity: result.data!,
          ));
        }
      case Error():
        {
          emit(SignUpErrorState(
            exception: result.exception!,
          ));
        }
    }
  }

  void doIntent(AuthIntent authIntent) {
    switch (authIntent) {
      case SignUpIntent():
        _signUp(authIntent.signUpRequestEntity);
    }
  }
}
