part of 'login_screen_cubit.dart';

/// enum for login status
enum LoginStatus {
  ///unknow,
  unknow,

  /// authenticated
  authenticated,

  /// loading
  loading,

  /// unauthenticated
  unauthenticated;

  /// isUnknow

  bool get isUnknow => this == LoginStatus.unknow;

  /// isAuthenticated
  bool get isAuthenticated => this == LoginStatus.authenticated;

  /// isUnauthenticated
  bool get isUnauthenticated => this == LoginStatus.unauthenticated;

  /// isLoading
  bool get isLoading => this == LoginStatus.loading;
}

/// Login screen state
final class LoginScreenState extends Equatable {
  /// Login screen state
  const LoginScreenState({
    this.email = '',
    this.password = '',
    this.status = LoginStatus.unknow,
  });

  /// email
  final String email;

  /// password
  final String password;

  /// status
  final LoginStatus status;

  @override
  List<Object> get props => [email, password, status];

  /// copy with
  LoginScreenState copyWith({
    String? email,
    String? password,
    LoginStatus? status,
  }) {
    return LoginScreenState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
