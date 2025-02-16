import 'package:equatable/equatable.dart';
import '../../../../../domain/entities/auth/sign_in/sign_in_request_entity.dart';


sealed class SingInIntent extends Equatable {}


 class SignInIntent extends SingInIntent {
  final SignInRequestEntity signInRequestEntity;
  SignInIntent({required this.signInRequestEntity});

  @override
  List<Object?> get props => [signInRequestEntity];
}