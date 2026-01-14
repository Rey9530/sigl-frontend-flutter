import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_client.dart';
import '../../data/datasources/caja_remote_datasource.dart';
import '../../data/repositories/caja_repository.dart';
import '../../domain/entities/resumen_caja.dart';
import '../../domain/entities/registro_recaudacion.dart';
import 'caja_state.dart';

// Provider para el datasource
final cajaRemoteDataSourceProvider = Provider<CajaRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return CajaRemoteDataSourceImpl(dio);
});

// Provider para el repository
final cajaRepositoryProvider = Provider<CajaRepository>((ref) {
  final dataSource = ref.watch(cajaRemoteDataSourceProvider);
  return CajaRepositoryImpl(dataSource);
});

// Provider principal de caja
final cajaProvider = StateNotifierProvider<CajaNotifier, CajaState>((ref) {
  final repository = ref.watch(cajaRepositoryProvider);
  return CajaNotifier(repository);
});

class CajaNotifier extends StateNotifier<CajaState> {
  final CajaRepository _repository;
  Timer? _refreshTimer;

  CajaNotifier(this._repository) : super(const CajaInitial()) {
    cargarResumen();
    // Actualizar cada 30 segundos
    _refreshTimer = Timer.periodic(
      const Duration(seconds: 30),
      (_) => cargarResumen(silencioso: true),
    );
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }

  Future<void> cargarResumen({bool silencioso = false}) async {
    if (!silencioso) {
      state = const CajaLoading();
    }

    final result = await _repository.obtenerMiTotal();

    result.fold(
      (failure) {
        if (!silencioso) {
          state = CajaError(failure.message);
        }
      },
      (resumen) {
        if (state is CajaLoaded) {
          state = (state as CajaLoaded).copyWith(resumen: resumen);
        } else {
          state = CajaLoaded(resumen: resumen);
        }
      },
    );
  }

  Future<void> cargarPendientes() async {
    final currentState = state;
    if (currentState is! CajaLoaded) {
      await cargarResumen();
    }

    final result = await _repository.obtenerMisPendientes();

    result.fold(
      (failure) {
        // Mantener estado actual pero mostrar error
      },
      (pendientes) {
        if (state is CajaLoaded) {
          state = (state as CajaLoaded).copyWith(pendientes: pendientes);
        }
      },
    );
  }

  void reiniciar() {
    state = const CajaInitial();
  }
}

// Provider solo para el resumen (mas eficiente)
final resumenCajaProvider = Provider<ResumenCaja?>((ref) {
  final cajaState = ref.watch(cajaProvider);
  if (cajaState is CajaLoaded) {
    return cajaState.resumen;
  }
  return null;
});

// Provider solo para pendientes
final pendientesCajaProvider = Provider<List<RegistroRecaudacion>>((ref) {
  final cajaState = ref.watch(cajaProvider);
  if (cajaState is CajaLoaded) {
    return cajaState.pendientes;
  }
  return [];
});
