import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/auth.dart';
import '../../services/auth_api.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    late final SharedPreferences _preferences;
    Auth auth;

    on<Regist>((event, emit) async {
      try {
        Map<String, dynamic> data = {
          'name': event.name,
          'email': event.email,
          'password': event.password,
          'phone': event.phone
        };
        auth = await AuthApi.regist(
          data: data,
        );

        emit(AuthLoaded(
          success: auth.success,
          email: '',
          token: '',
          message: auth.message,
        ));
      } catch (e) {
        emit(AuthError());
      }
    });

    on<Login>((event, emit) async {
      _preferences = await SharedPreferences.getInstance();
      try {
        Map<String, dynamic> data = {
          'email': event.email,
          'password': event.password,
        };
        auth = await AuthApi.login(
          data: data,
        );

        await _preferences.setString('email', auth.data!.email);
        await _preferences.setString('token', auth.data!.token);

        emit(AuthLoaded(
          success: auth.success,
          email: auth.data!.email,
          token: auth.data!.token,
          message: auth.message,
        ));
      } catch (e) {
        emit(AuthError());
      }
    });

    on<GetAuth>((event, emit) async {
      _preferences = await SharedPreferences.getInstance();
      String? _email = _preferences.getString('email');
      String? _token = _preferences.getString('token');

      if (_email != null && _token != null) {
        emit(AuthLoaded(
          success: true,
          email: _email,
          token: _token,
          message: '',
        ));
      } else {
        emit(AuthError());
      }
    });

    on<Logout>((event, emit) async {
      _preferences = await SharedPreferences.getInstance();
      await _preferences.remove('email');
      await _preferences.remove('token');
      emit(AuthInitial());
    });
  }
}
