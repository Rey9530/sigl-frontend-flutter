import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: 'id_usuario') required int id,
    required String email,
    required String nombre,
    required String rol,
    @JsonKey(name: 'punto_id') int? puntoId,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromEntity(User user) => UserModel(
        id: user.id,
        email: user.email,
        nombre: user.nombre,
        rol: user.rol,
        puntoId: user.puntoId,
      );
}

extension UserModelX on UserModel {
  User toEntity() => User(
        id: id,
        email: email,
        nombre: nombre,
        rol: rol,
        puntoId: puntoId,
      );
}
