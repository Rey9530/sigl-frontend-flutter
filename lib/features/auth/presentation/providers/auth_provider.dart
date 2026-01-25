import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../data/repositories/auth_repository_impl.dart';
import 'auth_state.dart';

// Usecase Providers
final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LoginUseCase(repository);
});

final registerUseCaseProvider = Provider<RegisterUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return RegisterUseCase(repository);
});

// Auth Notifier
class AuthNotifier extends StateNotifier<AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final AuthRepository _authRepository;

  AuthNotifier(
    this._loginUseCase,
    this._registerUseCase,
    this._authRepository,
  ) : super(const AuthState.initial());

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

  Future<bool> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    state = const AuthState.loading();

    final result = await _registerUseCase(
      name: name,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );

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

  Future<void> logout() async {
    state = const AuthState.loading();
    await _authRepository.logout();
    state = const AuthState.unauthenticated();
  }

  Future<void> checkAuthStatus() async {
    state = const AuthState.loading();

    final result = await _authRepository.checkAuthStatus();

    result.fold(
      (failure) {
        state = const AuthState.unauthenticated();
      },
      (user) {
        state = AuthState.authenticated(user);
      },
    );
  }

  Future<(bool, String?)> updatePassword({
    required String passwordActual,
    required String passwordNueva,
  }) async {
    final result = await _authRepository.updatePassword(
      passwordActual,
      passwordNueva,
    );

    return result.fold(
      (failure) => (false, failure.message),
      (_) => (true, null),
    );
  }

  Future<(bool, String?)> updateProfile({required String nombre}) async {
    final result = await _authRepository.updateProfile(nombre);

    return result.fold(
      (failure) => (false, failure.message),
      (user) {
        state = AuthState.authenticated(user);
        return (true, null);
      },
    );
  }
}

// Auth State Provider
final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final loginUseCase = ref.watch(loginUseCaseProvider);
  final registerUseCase = ref.watch(registerUseCaseProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthNotifier(loginUseCase, registerUseCase, authRepository);
});
