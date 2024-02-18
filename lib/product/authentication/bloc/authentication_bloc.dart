import 'dart:async';

import 'package:authentication_repository/index.dart';
import 'package:authentication_repository/src/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

/// Authentication bloc
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  /// Authentication bloc
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(
          authenticationRepository.currentUser.isNotEmpty
              ? AuthenticationState.authenticated(
                  authenticationRepository.currentUser,
                )
              : const AuthenticationState.unauthenticated(),
        ) {
    on<_AuthenticationUserChanged>(_autheticationUserChanged);
    on<AutheticationLogoutRequest>(_authenticationLogoutReqeust);
    _userSubscription = _authenticationRepository.user.listen(
      (user) => add(_AuthenticationUserChanged(user)),
    );
  }
  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<User> _userSubscription;

  FutureOr<void> _autheticationUserChanged(
    _AuthenticationUserChanged event,
    Emitter<AuthenticationState> emit,
  ) {
    emit(
      event.user.isNotEmpty
          ? AuthenticationState.authenticated(event.user)
          : const AuthenticationState.unauthenticated(),
    );
  }

  FutureOr<void> _authenticationLogoutReqeust(
    AutheticationLogoutRequest event,
    Emitter<AuthenticationState> emit,
  ) {
    unawaited(_authenticationRepository.logOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
