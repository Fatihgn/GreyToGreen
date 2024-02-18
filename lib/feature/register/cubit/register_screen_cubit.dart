import 'package:authentication_repository/index.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'register_screen_state.dart';

/// Register screen cubit
class RegisterScreenCubit extends Cubit<RegisterScreenState> {
  /// Register screen cubit constructor
  RegisterScreenCubit(this._authenticationRepository)
      : super(const RegisterScreenState());

  /// authentication repository
  final AuthenticationRepository _authenticationRepository;
  void emailChanged(String email) {
    emit(state.copyWith(email: email));
  }

  void passwordChanged(String password) {
    emit(state.copyWith(password: password));
  }

  void confirmedPasswordChanged(String confirmedPassword) {
    emit(state.copyWith(confirmedPassword: confirmedPassword));
  }

  Future<void> registerButtonTrigerred() async {
    emit(state.copyWith(status: RegisterScreenStatus.loading));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(status: RegisterScreenStatus.success));
    try {
      await _authenticationRepository.signUp(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(status: RegisterScreenStatus.success));
    } on FirebaseAuthException catch (e) {
      emit(
        state.copyWith(
          status: RegisterScreenStatus.failure,
          errorMessage: e.message,
        ),
      );
    }
  }
}
