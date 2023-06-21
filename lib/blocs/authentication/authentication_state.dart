import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitialState extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationNotAuthenticatedState extends AuthenticationState {}

class AuthenticationAuthenticatedState extends AuthenticationState {}

class AuthenticationFailureState extends AuthenticationState {
  final String message;

  const AuthenticationFailureState({required this.message});

  @override
  List<Object> get props => [message];
}
