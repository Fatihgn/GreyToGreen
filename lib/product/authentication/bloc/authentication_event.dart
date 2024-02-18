part of 'authentication_bloc.dart';

/// Authentication enum

/// Authentication event
sealed class AuthenticationEvent {
  /// Authentication event
  const AuthenticationEvent();
}

/// App log
final class AutheticationLogoutRequest extends AuthenticationEvent {
  /// App logout request
  const AutheticationLogoutRequest();
}

/// App user changed
final class _AuthenticationUserChanged extends AuthenticationEvent {
  const _AuthenticationUserChanged(this.user);
  final User user;
}
