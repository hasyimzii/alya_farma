import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/user.dart';
import '../../services/user_api.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    User user;

    on<GetUser>((event, emit) async {
      try {
        user = await UserApi.getUser(email: event.email, token: event.token);

        emit(UserLoaded(
          user: user.data,
          message: user.message,
        ));
      } catch (e) {
        emit(UserError());
      }
    });

    on<UpdateUser>((event, emit) async {
      try {
        Map<String, dynamic> data = {
          'name': event.name,
          'email': event.email,
          'phone': event.phone,
          'password': event.password,
        };
        user = await UserApi.updateUser(data: data, token: event.token);

        emit(UserUpdated(
          success: true,
          user: user.data,
          message: user.message,
        ));
      } catch (e) {
        emit(UserError());
      }
    });
  }
}
