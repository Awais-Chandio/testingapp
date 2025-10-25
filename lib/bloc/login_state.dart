part of 'login_cubit.dart';

enum LoginStatus { initial, loading, success, error }

class LoginState extends Equatable {
  final LoginStatus status;
  final String? errorMessage;
  final LoginResponse? response;

  const LoginState({required this.status, this.errorMessage, this.response});

  const LoginState.initial() : status = LoginStatus.initial, errorMessage = null, response = null;

  LoginState copyWith({LoginStatus? status, String? errorMessage, LoginResponse? response}) {
    return LoginState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      response: response ?? this.response,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, response];
}