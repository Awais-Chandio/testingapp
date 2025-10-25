import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../repositories/auth_repository.dart';
import '../models/login_response.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository repository;
  LoginCubit(this.repository) : super(const LoginState.initial());

  Future<void> login({required String email, required String password}) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      final LoginResponse res = await repository.login(email: email, password: password);
      emit(state.copyWith(status: LoginStatus.success, response: res));
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.error, errorMessage: e.toString()));
    }
  }
}