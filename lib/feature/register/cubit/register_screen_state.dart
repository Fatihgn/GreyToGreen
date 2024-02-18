part of 'register_screen_cubit.dart';

enum RegisterScreenStatus {
  /// initial state
  inital,

  /// loading state
  loading,

  /// success state
  success,

  /// failure state
  failure;

  // bana bu enum ın getter larını yazsana

  bool get isInitial => this == RegisterScreenStatus.inital;
  bool get isLoading => this == RegisterScreenStatus.loading;
  bool get isSuccess => this == RegisterScreenStatus.success;
  bool get isFailure => this == RegisterScreenStatus.failure;
}

/// register screen state
final class RegisterScreenState extends Equatable {
  /// register screen state constructor
  const RegisterScreenState({
    this.email = '',
    this.password = '',
    this.confirmedPassword = '',
    this.status = RegisterScreenStatus.inital,
    this.errorMessage = '',
  });

  /// email
  final String email;

  /// password
  final String password;

  /// confirmed password
  final String confirmedPassword;

  /// status
  final RegisterScreenStatus status;

  /// error message
  final String? errorMessage;
  @override
  List<Object> get props => [email, password, confirmedPassword, status];

  /// copy with method
  RegisterScreenState copyWith({
    String? email,
    String? password,
    String? confirmedPassword,
    RegisterScreenStatus? status,
    String? errorMessage,
  }) {
    return RegisterScreenState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
