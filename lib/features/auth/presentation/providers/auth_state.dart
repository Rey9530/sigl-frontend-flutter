import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(User user) = _Authenticated;
  const factory AuthState.unauthenticated({String? errorMessage}) = _Unauthenticated;

  const AuthState._();

  bool get isLoading => maybeWhen(loading: () => true, orElse: () => false);
  bool get isAuthenticated => maybeWhen(authenticated: (_) => true, orElse: () => false);
  String? get errorMessage => maybeWhen(unauthenticated: (msg) => msg, orElse: () => null);
  User? get user => maybeWhen(authenticated: (user) => user, orElse: () => null);
}
