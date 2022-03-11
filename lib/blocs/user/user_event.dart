part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUser extends UserEvent {
  const GetUser({
    required this.email,
    required this.token,
  });

  final String email;
  final String token;

  @override
  List<Object> get props => [email, token];
}

class UpdateUser extends UserEvent {
  const UpdateUser({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.token,
  });

  final String name;
  final String email;
  final String phone;
  final String password;
  final String token;

  @override
  List<Object> get props => [name, email, phone, password, token];
}
