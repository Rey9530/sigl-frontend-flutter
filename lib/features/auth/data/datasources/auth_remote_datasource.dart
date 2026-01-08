import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSourceImpl(this._apiClient);

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await _apiClient.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      final data = response.data;
      // El backend devuelve { access_token: "...", usuario: { ... } }
      // Devolvemos el usuario, pero idealmente deberíamos guardar el token aquí o en el repositorio.
      // Por simplicidad en UserModel.fromJson esperamos la estructura del usuario directamente
      // o adaptamos aquí.
      
      // Ajuste: El backend devuelve `usuario` dentro de la respuesta.
      return UserModel.fromJson(data['usuario']);
    } catch (e) {
      // ApiClient ya debería lanzar excepciones manejadas o DioException
      rethrow;
    }
  }
}

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AuthRemoteDataSourceImpl(apiClient);
});
