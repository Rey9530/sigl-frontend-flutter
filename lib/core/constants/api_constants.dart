class ApiConstants {
  ApiConstants._();

  // Base URL - Cambiar según el ambiente
  static const String baseUrl = 'http://localhost:8000/api';

  // Auth endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';
  static const String profile = '/auth/profile';

  // Paquetes endpoints
  static const String paquetes = '/paquetes';
  static const String paquetesOcr = '/paquetes/ocr';
  static const String paquetesUpload = '/paquetes/upload-vineta';
  static const String paquetesRastreo = '/paquetes/rastreo';

  // Puntos endpoints
  static const String puntos = '/puntos';
  static const String puntosActivos = '/puntos/activos';

  // Headers
  static const String contentType = 'application/json';
  static const String accept = 'application/json';
  static const String authorization = 'Authorization';
  static const String bearer = 'Bearer';
}
