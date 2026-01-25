import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../domain/entities/datos_vineta_extraidos.dart';
import '../providers/recepcion_provider.dart';
import '../providers/recepcion_state.dart';
import '../widgets/campo_editable.dart';

class VerificacionDatosScreen extends ConsumerStatefulWidget {
  const VerificacionDatosScreen({super.key});

  @override
  ConsumerState<VerificacionDatosScreen> createState() =>
      _VerificacionDatosScreenState();
}

class _VerificacionDatosScreenState
    extends ConsumerState<VerificacionDatosScreen> {
  final _formKey = GlobalKey<FormState>();
  final _costoEnvioController = TextEditingController();

  // Controladores para campos editables
  late String? _vendedor;
  late String? _cliente;
  late String? _telefono;
  late String? _destino;
  late String? _diaEntrega;
  late String? _encomendista;
  late double? _precioProducto;

  bool _initialized = false;

  void _initializeControllers(DatosVinetaExtraidos datos) {
    if (_initialized) return;
    _vendedor = datos.vendedor;
    _cliente = datos.cliente;
    _telefono = datos.telefono;
    _destino = datos.destino;
    _diaEntrega = datos.diaEntrega;
    _encomendista = datos.encomendista;
    _precioProducto = datos.precioProducto;
    _costoEnvioController.text =
        datos.costoEnvio?.toStringAsFixed(2) ?? '';
    _initialized = true;
  }

  DatosVinetaExtraidos _buildDatosEditados(DatosVinetaExtraidos original) {
    final costoEnvio = double.tryParse(_costoEnvioController.text) ?? 0.0;
    return DatosVinetaExtraidos(
      imagenUrl: original.imagenUrl,
      imagenObjectName: original.imagenObjectName,
      vendedor: _vendedor,
      cliente: _cliente,
      telefono: _telefono,
      diaEntrega: _diaEntrega,
      destino: _destino,
      encomendista: _encomendista,
      precioProducto: _precioProducto,
      costoEnvio: costoEnvio,
      total: (_precioProducto ?? 0) + costoEnvio,
      confianzaGlobal: original.confianzaGlobal,
      confianzaDetalle: original.confianzaDetalle,
      requiereMontoManual: false, // Ya fue ingresado
    );
  }

  void _onDatosCorrectos() {
    if (!_formKey.currentState!.validate()) return;

    final state = ref.read(recepcionProvider);
    final datos = state.datosExtraidosActuales;

    if (datos == null) return;

    final costoEnvio = double.tryParse(_costoEnvioController.text) ?? 0.0;
    final datosEditados = _buildDatosEditados(datos);

    ref.read(recepcionProvider.notifier).confirmarDatos(
          datosEditados,
          costoEnvio,
        );
  }

  void _onVolverACapturar() {
    ref.read(recepcionProvider.notifier).volverACapturar();
    context.go('/recepcion/captura');
  }

  @override
  void dispose() {
    _costoEnvioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(recepcionProvider);

    // Listener para navegación cuando pasa al estado de cobro
    ref.listen<RecepcionState>(recepcionProvider, (previous, next) {
      next.maybeWhen(
        confirmandoCobro: (datos, imagenPath, costoEnvio) {
          context.push('/recepcion/cobro');
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
        title: const Text('Verificar Datos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _onVolverACapturar,
        ),
      ),
      body: state.maybeWhen(
        datosExtraidos: (datos, imagenPath) {
          _initializeControllers(datos);
          return _buildContent(context, datos, imagenPath);
        },
        orElse: () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('No hay datos para verificar'),
              const SizedBox(height: 16),
              CustomButton(
                text: 'Volver a Capturar',
                onPressed: _onVolverACapturar,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    DatosVinetaExtraidos datos,
    String imagenPath,
  ) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Imagen capturada (thumbnail)
                  _buildImagenPreview(imagenPath, datos.imagenUrl),
                  const SizedBox(height: 16),

                  // Indicador de confianza
                  _buildConfianzaIndicator(datos),
                  const SizedBox(height: 24),

                  // Campos editables
                  Text(
                    'Datos Extraidos',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Revisa y corrige los datos si es necesario',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),

                  CampoEditable(
                    label: 'Vendedor',
                    value: _vendedor,
                    confianza: datos.getConfianzaCampo('vendedor'),
                    onChanged: (v) => setState(() => _vendedor = v),
                  ),
                  const SizedBox(height: 12),

                  CampoEditable(
                    label: 'Cliente',
                    value: _cliente,
                    confianza: datos.getConfianzaCampo('cliente'),
                    onChanged: (v) => setState(() => _cliente = v),
                  ),
                  const SizedBox(height: 12),

                  CampoEditable(
                    label: 'Telefono',
                    value: _telefono,
                    confianza: datos.getConfianzaCampo('telefono'),
                    keyboardType: TextInputType.phone,
                    onChanged: (v) => setState(() => _telefono = v),
                  ),
                  const SizedBox(height: 12),

                  CampoEditable(
                    label: 'Destino',
                    value: _destino,
                    confianza: datos.getConfianzaCampo('destino'),
                    onChanged: (v) => setState(() => _destino = v),
                  ),
                  const SizedBox(height: 12),

                  CampoEditable(
                    label: 'Dia de Entrega',
                    value: _diaEntrega,
                    confianza: datos.getConfianzaCampo('dia_entrega'),
                    onChanged: (v) => setState(() => _diaEntrega = v),
                  ),
                  const SizedBox(height: 12),

                  CampoEditable(
                    label: 'Encomendista',
                    value: _encomendista,
                    confianza: datos.getConfianzaCampo('encomendista'),
                    onChanged: (v) => setState(() => _encomendista = v),
                  ),
                  const SizedBox(height: 24),

                  // Seccion de montos
                  Text(
                    'Montos',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),

                  CampoEditable(
                    label: 'Precio Producto',
                    value: _precioProducto?.toStringAsFixed(2),
                    confianza: datos.getConfianzaCampo('precio_producto'),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    prefijo: '\$ ',
                    onChanged: (v) => setState(
                      () => _precioProducto = double.tryParse(v),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Costo de envio (obligatorio)
                  _buildCostoEnvioField(datos),
                  const SizedBox(height: 16),

                  // Total calculado
                  _buildTotalPreview(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),

          // Botones de accion
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildImagenPreview(String imagenPath, String imagenUrl) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: imagenPath.isNotEmpty && File(imagenPath).existsSync()
            ? Image.file(
                File(imagenPath),
                fit: BoxFit.cover,
              )
            : Image.network(
                imagenUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Center(
                  child: Icon(Icons.image_not_supported, size: 48),
                ),
              ),
      ),
    );
  }

  Widget _buildConfianzaIndicator(DatosVinetaExtraidos datos) {
    Color color;
    IconData icon;
    String texto;

    if (datos.confianzaAlta) {
      color = AppColors.success;
      icon = Icons.verified;
      texto = 'Alta confianza';
    } else if (datos.confianzaMedia) {
      color = Colors.orange;
      icon = Icons.warning_amber;
      texto = 'Confianza media - Revisa los campos';
    } else {
      color = AppColors.error;
      icon = Icons.error_outline;
      texto = 'Baja confianza - Verifica cuidadosamente';
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  texto,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Confianza OCR: ${datos.confianzaGlobal}%',
                  style: TextStyle(
                    color: color.withValues(alpha: 0.8),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCostoEnvioField(DatosVinetaExtraidos datos) {
    final requiereManual = datos.requiereMontoManual;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Costo de Envio',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: requiereManual ? Colors.red[700] : Colors.grey[700],
              ),
            ),
            const SizedBox(width: 4),
            const Text(
              '*',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            if (requiereManual) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Requerido',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.orange[800],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: _costoEnvioController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
          ],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'El costo de envio es obligatorio';
            }
            final numero = double.tryParse(value);
            if (numero == null) {
              return 'Ingresa un numero valido';
            }
            if (numero < 0) {
              return 'El costo no puede ser negativo';
            }
            return null;
          },
          decoration: InputDecoration(
            prefixText: '\$ ',
            prefixStyle:
                const TextStyle(fontSize: 15, color: Colors.black87),
            hintText: '0.00',
            isDense: true,
            filled: true,
            fillColor:
                requiereManual ? Colors.orange[50] : Colors.grey[50],
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: requiereManual
                    ? Colors.orange[300]!
                    : Colors.grey[300]!,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: requiereManual
                    ? Colors.orange[300]!
                    : Colors.grey[300]!,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: requiereManual ? Colors.orange : AppColors.primary,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTotalPreview() {
    final precioProducto = _precioProducto ?? 0.0;
    final costoEnvio = double.tryParse(_costoEnvioController.text) ?? 0.0;
    final total = precioProducto + costoEnvio;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total a Cobrar',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '\$ ${total.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Producto: \$ ${precioProducto.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                'Envio: \$ ${costoEnvio.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Volver a Capturar',
                icon: Icons.camera_alt,
                isOutlined: true,
                onPressed: _onVolverACapturar,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomButton(
                text: 'Datos Correctos',
                icon: Icons.check,
                onPressed: _onDatosCorrectos,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
