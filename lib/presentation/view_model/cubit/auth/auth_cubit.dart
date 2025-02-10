import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/presentation/view_model/cubit/auth/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);
}
