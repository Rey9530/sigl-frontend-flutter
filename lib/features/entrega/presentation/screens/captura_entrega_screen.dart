import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/loading_indicator.dart';
import '../providers/entrega_provider.dart';
import '../providers/entrega_state.dart';
import '../widgets/codigo_manual_modal.dart';

class CapturaEntregaScreen extends ConsumerStatefulWidget {
  const CapturaEntregaScreen({super.key});

  @override
  ConsumerState<CapturaEntregaScreen> createState() =>
      _CapturaEntregaScreenState();
}

class _CapturaEntregaScreenState extends ConsumerState<CapturaEntregaScreen> {
  CameraController? _cameraController;
  bool _isCameraInitialized = false;
  bool _isCapturing = false;
  bool _hasPermission = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    // Solicitar permiso de camara
    final status = await Permission.camera.request();

    if (status.isGranted) {
      setState(() => _hasPermission = true);

      try {
        final cameras = await availableCameras();
        if (cameras.isNotEmpty) {
          _cameraController = CameraController(
            cameras.first,
            ResolutionPreset.high,
            enableAudio: false,
          );
          await _cameraController!.initialize();
          if (mounted) {
            setState(() => _isCameraInitialized = true);
          }
        } else {
          setState(() {
            _errorMessage = 'No se encontraron camaras disponibles';
          });
        }
      } catch (e) {
        setState(() {
          _errorMessage = 'Error al inicializar camara: $e';
        });
      }
    } else {
      setState(() {
        _hasPermission = false;
        _errorMessage = 'Se requiere permiso de camara para continuar';
      });
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  Future<void> _capturarFoto() async {
    if (_cameraController == null || _isCapturing) return;

    setState(() => _isCapturing = true);

    try {
      final image = await _cameraController!.takePicture();
      await ref
          .read(entregaProvider.notifier)
          .registrarEntrega(File(image.path));
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al capturar foto: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isCapturing = false);
      }
    }
  }

  Future<void> _seleccionarDeGaleria() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1920,
      maxHeight: 1080,
      imageQuality: 85,
    );

    if (image != null) {
      await ref
          .read(entregaProvider.notifier)
          .registrarEntrega(File(image.path));
    }
  }

  void _mostrarModalCodigoManual(String? mensajeOcr) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => CodigoManualModal(
        mensajeError: mensajeOcr,
        onConfirmar: (codigo) {
          ref.read(entregaProvider.notifier).reintentarConCodigoManual(codigo);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(entregaProvider);

    // Escuchar cambios de estado para navegar o mostrar modales
    ref.listen<EntregaState>(entregaProvider, (previous, next) {
      if (next is EntregaExitosa) {
        context.push('/entrega/confirmacion');
      } else if (next is EntregaCodigoNoDetectado) {
        _mostrarModalCodigoManual(next.mensajeOcr);
      } else if (next is EntregaPaqueteNoEncontrado) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'No se encontro paquete con codigo: ${next.codigoBuscado}',
            ),
            backgroundColor: AppColors.error,
            action: SnackBarAction(
              label: 'Reintentar',
              textColor: Colors.white,
              onPressed: () => _mostrarModalCodigoManual(null),
            ),
          ),
        );
      } else if (next is EntregaConflicto) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.mensaje),
            backgroundColor: AppColors.warning,
            duration: const Duration(seconds: 5),
          ),
        );
      } else if (next is EntregaError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.mensaje),
            backgroundColor: AppColors.error,
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Entregar Paquete'),
        actions: [
          IconButton(
            icon: const Icon(Icons.photo_library),
            onPressed: _seleccionarDeGaleria,
            tooltip: 'Seleccionar de galeria',
          ),
        ],
      ),
      body: state is EntregaProcesando
          ? const LoadingScreen(message: 'Procesando entrega...')
          : _buildCameraView(),
    );
  }

  Widget _buildCameraView() {
    if (_errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: AppColors.error),
              const SizedBox(height: 16),
              Text(
                _errorMessage!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              if (!_hasPermission)
                CustomButton(
                  text: 'Abrir Configuracion',
                  onPressed: () => openAppSettings(),
                ),
              const SizedBox(height: 16),
              CustomButton(
                text: 'Seleccionar de Galeria',
                isOutlined: true,
                onPressed: _seleccionarDeGaleria,
              ),
            ],
          ),
        ),
      );
    }

    if (!_isCameraInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Stack(
      children: [
        // Vista de camara
        Positioned.fill(child: CameraPreview(_cameraController!)),

        // Guia de encuadre
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.success, width: 3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.local_shipping,
                  size: 48,
                  color: Colors.white.withValues(alpha: 0.7),
                ),
                const SizedBox(height: 8),
                Text(
                  'Escanea la vineta del paquete a ENTREGAR',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Colors.black.withValues(alpha: 0.5),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),

        // Instrucciones
        Positioned(
          top: 16,
          left: 16,
          right: 16,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'Asegurate de que el codigo de rastreo sea visible y legible',
              style: TextStyle(color: Colors.white, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
        ),

        // Boton de captura
        Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Boton galeria
              FloatingActionButton(
                heroTag: 'gallery_entrega',
                onPressed: _seleccionarDeGaleria,
                backgroundColor: Colors.white,
                child: const Icon(Icons.photo_library, color: Colors.black87),
              ),
              const SizedBox(width: 32),
              // Boton captura
              FloatingActionButton.large(
                heroTag: 'capture_entrega',
                onPressed: _isCapturing ? null : _capturarFoto,
                backgroundColor: AppColors.success,
                child: _isCapturing
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Icon(Icons.camera_alt, size: 40),
              ),
              const SizedBox(width: 32),
              // Boton codigo manual
              FloatingActionButton(
                heroTag: 'manual_code',
                onPressed: () => _mostrarModalCodigoManual(null),
                backgroundColor: Colors.white,
                child: const Icon(Icons.keyboard, color: Colors.black87),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
