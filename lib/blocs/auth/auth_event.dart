part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class GetPreference extends AuthEvent {}

class Regist extends AuthEvent {
  const Regist({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  final String name;
  final String email;
  final String password;
  final String phone;

  @override
  List<Object> get props => [name, email, password, phone];
}

class Login extends AuthEvent {
  const Login({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

class GetAuth extends AuthEvent {}

class Logout extends AuthEvent {}
