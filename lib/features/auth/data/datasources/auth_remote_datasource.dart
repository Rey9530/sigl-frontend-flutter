import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../models/user_model.dart';

/// Clase que representa la respuesta de autenticación del backend
class AuthResponse {
  final String accessToken;
  final UserModel user;

  AuthResponse({
    required this.accessToken,
    required this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      accessToken: json['access_token'] as String,
      user: UserModel.fromJson(json['usuario'] as Map<String, dynamic>),
    );
  }
}

abstract class AuthRemoteDataSource {
  Future<AuthResponse> login(String email, String password);
  Future<AuthResponse> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  });
  Future<void> updatePassword(String passwordActual, String passwordNueva);
  Future<UserModel> updateProfile(String nombre);
  Future<UserModel> getProfile();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSourceImpl(this._apiClient);

  @override
  Future<AuthResponse> login(String email, String password) async {
    final response = await _apiClient.post(
      '/auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    return AuthResponse.fromJson(response.data);
  }

  @override
  Future<AuthResponse> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    final response = await _apiClient.post(
      '/auth/register',
      data: {
        'nombre': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
      },
    );

    return AuthResponse.fromJson(response.data);
  }

  @override
  Future<void> updatePassword(String passwordActual, String passwordNueva) async {
    await _apiClient.patch(
      '/auth/password',
      data: {
        'password_actual': passwordActual,
        'password_nueva': passwordNueva,
      },
    );
  }

  @override
  Future<UserModel> updateProfile(String nombre) async {
    final response = await _apiClient.patch(
      '/auth/perfil',
      data: {
        'nombre': nombre,
      },
    );

    return UserModel.fromJson(response.data);
  }

  @override
  Future<UserModel> getProfile() async {
    final response = await _apiClient.get('/auth/perfil');
    return UserModel.fromJson(response.data);
  }
}

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AuthRemoteDataSourceImpl(apiClient);
});
