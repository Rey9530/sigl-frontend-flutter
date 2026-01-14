import '../../domain/entities/resumen_caja.dart';
import '../../domain/entities/registro_recaudacion.dart';

abstract class CajaState {
  const CajaState();
}

class CajaInitial extends CajaState {
  const CajaInitial();
}

class CajaLoading extends CajaState {
  const CajaLoading();
}

class CajaLoaded extends CajaState {
  final ResumenCaja resumen;
  final List<RegistroRecaudacion> pendientes;

  const CajaLoaded({
    required this.resumen,
    this.pendientes = const [],
  });

  CajaLoaded copyWith({
    ResumenCaja? resumen,
    List<RegistroRecaudacion>? pendientes,
  }) {
    return CajaLoaded(
      resumen: resumen ?? this.resumen,
      pendientes: pendientes ?? this.pendientes,
    );
  }
}

class CajaError extends CajaState {
  final String mensaje;

  const CajaError(this.mensaje);
}
