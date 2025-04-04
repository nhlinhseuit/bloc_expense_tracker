import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  SignupBloc() : super(SignupInitial()) {
    on<SignupWithEmailPassword>(_onSignupWithEmailPassword);
  }

  Future<void> _onSignupWithEmailPassword(
    SignupWithEmailPassword event,
    Emitter<SignupState> emit,
  ) async {
    emit(SignupLoading());

    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      await FirebaseAuth.instance.signOut();

      emit(SignupSuccess());
    } on FirebaseAuthException catch (e) {
      emit(SignupFailure(e.message ?? 'Đăng ký thất bại'));
    } catch (e) {
      emit(SignupFailure('Lỗi không xác định: ${e.toString()}'));
    }
  }
}
