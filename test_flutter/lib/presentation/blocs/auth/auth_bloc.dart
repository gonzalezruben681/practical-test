import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/domain/usecases/auth_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticationUseCase authenticationUseCase;
  String _emailUser = '';
  AuthBloc({required this.authenticationUseCase}) : super(AuthInitial()) {
    on<LoginUserEvent>((event, emit) async {
      emit(AuthLoading());
      final result =
          await authenticationUseCase.loginUser(event.email, event.password);
      if (result.contains('@')) {
        emailUser = result;
        emit(AuthSuccess(emailUser: result, isLogin: true));
      } else {
        emit(AuthError(message: result));
      }
    });

    on<RegisterUserEvent>((event, emit) async {
      emit(AuthLoading());
      final result =
          await authenticationUseCase.registerUser(event.email, event.password);
      if (result.contains('@')) {
        emailUser = result;
        emit(AuthSuccess(emailUser: result, isLogin: true));
      } else {
        emit(AuthError(message: result));
      }
    });

    on<LogoutEvent>((event, emit) async {
      emit(AuthInitial());
    });
  }

  String get email => _emailUser;

  set emailUser(String value) {
    _emailUser = value;
  }
}
