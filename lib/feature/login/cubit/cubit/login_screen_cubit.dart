import 'package:authentication_repository/index.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_screen_state.dart';

/// Login screen cubit
class LoginScreenCubit extends Cubit<LoginScreenState> {
  /// Login screen cubit
  LoginScreenCubit({required this.authenticationRepository})
      : super(const LoginScreenState());

  /// authentication repository
  final AuthenticationRepository authenticationRepository;

  /// email controller
  void emailChanged(String email) {
    emit(state.copyWith(email: email));
  }

  /// password controller
  void passwordChanged(String password) {
    emit(state.copyWith(password: password));
  }

  /// login with credentials
  Future<void> loginWithCredentials() async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      await authenticationRepository.logInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(status: LoginStatus.authenticated));
    } on Exception {
      emit(state.copyWith(status: LoginStatus.unauthenticated));
    }
  }
}
