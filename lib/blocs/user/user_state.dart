part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoaded extends UserState {
  const UserLoaded({
    this.success = false,
    required this.user,
    required this.message,
  });

  final bool success;
  final UserData user;
  final String message;

  @override
  List<Object> get props => [user, message];
}

class UserError extends UserState {}
