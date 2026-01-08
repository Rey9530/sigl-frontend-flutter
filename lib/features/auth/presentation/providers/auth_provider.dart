import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../data/repositories/auth_repository_impl.dart';
import 'auth_state.dart';

// Usecase Provider
final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LoginUseCase(repository);
});

// Auth Notifier
class AuthNotifier extends StateNotifier<AuthState> {
  final LoginUseCase _loginUseCase;

  AuthNotifier(this._loginUseCase) : super(const AuthState.initial());

  Future<bool> login({required String email, required String password}) async {
    state = const AuthState.loading();

    final result = await _loginUseCase(email, password);

    return result.fold(
      (failure) {
        state = AuthState.unauthenticated(errorMessage: failure.message);
        return false;
      },
      (user) {
        state = AuthState.authenticated(user);
        return true;
      },
    );
  }

  void logout() {
    state = const AuthState.unauthenticated();
  }
}

// Auth State Provider
final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final loginUseCase = ref.watch(loginUseCaseProvider);
  return AuthNotifier(loginUseCase);
});
