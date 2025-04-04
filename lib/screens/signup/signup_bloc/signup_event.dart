part of 'signup_bloc.dart';

sealed class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object?> get props => [];
}

class SignupWithEmailPassword extends SignupEvent {
  final String email;
  final String password;

  const SignupWithEmailPassword(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
