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
import '../../../auth/presentation/providers/auth_provider.dart';
import '../providers/recepcion_provider.dart';
import '../providers/recepcion_state.dart';

class CapturaVinetaScreen extends ConsumerStatefulWidget {
  const CapturaVinetaScreen({super.key});

  @override
  ConsumerState<CapturaVinetaScreen> createState() =>
      _CapturaVinetaScreenState();
}

class _CapturaVinetaScreenState extends ConsumerState<CapturaVinetaScreen> {
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

  int? _getPuntoId() {
    final authState = ref.read(authStateProvider);
    return authState.user?.puntoId;
  }

  Future<void> _capturarFoto() async {
    if (_cameraController == null || _isCapturing) return;

    final puntoId = _getPuntoId();
    if (puntoId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No tienes un punto de servicio asignado'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    setState(() => _isCapturing = true);

    try {
      final image = await _cameraController!.takePicture();
      await ref
          .read(recepcionProvider.notifier)
          .crearRecepcion(File(image.path), puntoId);
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
    final puntoId = _getPuntoId();
    if (puntoId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No tienes un punto de servicio asignado'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    final picker = ImagePicker();
    final image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1920,
      maxHeight: 1080,
      imageQuality: 85,
    );

    if (image != null) {
      await ref
          .read(recepcionProvider.notifier)
          .crearRecepcion(File(image.path), puntoId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(recepcionProvider);

    // Escuchar cambios de estado para navegar
    ref.listen<RecepcionState>(recepcionProvider, (previous, next) {
      next.maybeWhen(
        recepcionCreada: (rec, path) {
          context.push('/recepcion/confirmacion');
        },
        error: (mensaje, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(mensaje), backgroundColor: AppColors.error),
          );
        },
        orElse: () {},
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Capturar Vineta'),
        actions: [
          IconButton(
            icon: const Icon(Icons.photo_library),
            onPressed: _seleccionarDeGaleria,
            tooltip: 'Seleccionar de galeria',
          ),
        ],
      ),
      body: state.maybeWhen(
        procesandoRecepcion: () =>
            const LoadingScreen(message: 'Procesando imagen con OCR...'),
        orElse: () => _buildCameraView(),
      ),
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
              border: Border.all(color: AppColors.primary, width: 3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.document_scanner,
                  size: 48,
                  color: Colors.white.withValues(alpha: 0.7),
                ),
                const SizedBox(height: 8),
                Text(
                  'Coloca la vineta dentro del recuadro',
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
              'Asegurate de que la vineta este bien iluminada y los datos sean legibles',
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
                heroTag: 'gallery',
                onPressed: _seleccionarDeGaleria,
                backgroundColor: Colors.white,
                child: const Icon(Icons.photo_library, color: Colors.black87),
              ),
              const SizedBox(width: 32),
              // Boton captura
              FloatingActionButton.large(
                heroTag: 'capture',
                onPressed: _isCapturing ? null : _capturarFoto,
                backgroundColor: AppColors.primary,
                child: _isCapturing
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Icon(Icons.camera_alt, size: 40),
              ),
              const SizedBox(width: 32),
              // Placeholder para simetria
              const SizedBox(width: 56),
            ],
          ),
        ),
      ],
    );
  }
}
