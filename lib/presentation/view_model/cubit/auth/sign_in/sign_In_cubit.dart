import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/domain/common/result.dart';
import 'package:online_exam/presentation/view_model/cubit/auth/sign_in/sign_In_states.dart';
import '../../../../../domain/entities/auth/sign_in/sign_in_request_entity.dart';
import '../../../../../domain/use_cases/auth/sign_in.dart';
import 'sign_in_intent.dart';

@injectable
class SignInCubit extends Cubit<SignInStates> {
  SignInCubit(this._signInCall) : super(SignInInitialState());

  final SignIn _signInCall;

  static SignInCubit get(BuildContext context) => BlocProvider.of<SignInCubit>(context);

  void _signIn(SignInRequestEntity signInRequestEntity) async {
    emit(SignInLoadingState());
    final result = await _signInCall(signInRequestEntity);
    switch (result) {
      case Success():
        emit(SignInSuccessState(
          signInResponseEntity: result.data!,
        ));
      case Error():
        emit(SignInErrorState(
          exception: result.exception!,
        ));
    }
  }

  void doIntent(SignInIntent authIntent) {
    switch (authIntent) {
      case SignInIntent():
        _signIn(authIntent.signInRequestEntity);
    }
  }
}
