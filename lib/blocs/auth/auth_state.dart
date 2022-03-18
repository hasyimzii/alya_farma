part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoaded extends AuthState {
  const AuthLoaded({
    required this.success,
    required this.email,
    required this.token,
    required this.message,
  });

  final bool success;
  final String email;
  final String token;
  final String message;

  @override
  List<Object> get props => [success, email, token, message];
}

class AuthError extends AuthState {}
