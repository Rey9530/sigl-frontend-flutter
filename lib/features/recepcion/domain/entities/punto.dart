import 'package:freezed_annotation/freezed_annotation.dart';

part 'punto.freezed.dart';
part 'punto.g.dart';

@freezed
class Punto with _$Punto {
  const factory Punto({
    @JsonKey(name: 'id_punto') required int id,
    required String nombre,
    required String codigo,
    String? ciudad,
    String? departamento,
  }) = _Punto;

  factory Punto.fromJson(Map<String, dynamic> json) => _$PuntoFromJson(json);
}
