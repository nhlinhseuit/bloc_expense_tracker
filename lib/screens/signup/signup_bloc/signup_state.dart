part of 'signup_bloc.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  @override
  List<Object> get props => [];
}


class SignupFailure extends SignupState {
  final String error;

  const SignupFailure(this.error);

  @override
  List<Object> get props => [error];
}
