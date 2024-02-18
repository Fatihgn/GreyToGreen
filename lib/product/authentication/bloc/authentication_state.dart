part of 'authentication_bloc.dart';

/// enum for authentication status
enum AuthenticationStatus {
  ///unknow,
  unknow,

  /// authenticated
  authenticated,

  /// loading
  loading,

  /// unauthenticated
  unauthenticated;

  bool get isUnknow => this == AuthenticationStatus.unknow;
  bool get isAuthenticated => this == AuthenticationStatus.authenticated;
  bool get isUnauthenticated => this == AuthenticationStatus.unauthenticated;
  bool get isLoading => this == AuthenticationStatus.loading;
}

/// Authentication event
final class AuthenticationState extends Equatable {
  const AuthenticationState({required this.status, this.user = User.empty});

  const AuthenticationState.authenticated(User user)
      : this(status: AuthenticationStatus.authenticated, user: user);
  const AuthenticationState.unauthenticated()
      : this(status: AuthenticationStatus.unauthenticated);

  /// status
  final AuthenticationStatus status;

  /// user
  final User user;
  @override
  List<Object> get props => [status, user];
}
