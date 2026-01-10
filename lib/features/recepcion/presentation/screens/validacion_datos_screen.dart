import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../domain/entities/recepcion_paquete.dart';
import '../../domain/entities/punto.dart';
import '../providers/recepcion_provider.dart';
import '../providers/recepcion_state.dart';
import '../widgets/ocr_confidence_indicator.dart';
import '../widgets/campo_editable.dart';

class ValidacionDatosScreen extends ConsumerStatefulWidget {
  const ValidacionDatosScreen({super.key});

  @override
  ConsumerState<ValidacionDatosScreen> createState() =>
      _ValidacionDatosScreenState();
}

class _ValidacionDatosScreenState extends ConsumerState<ValidacionDatosScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para los 9 campos OCR
  late TextEditingController _vendedorCtrl;
  late TextEditingController _clienteCtrl;
  late TextEditingController _telefonoCtrl;
  late TextEditingController _diaEntregaCtrl;
  late TextEditingController _destinoCtrl;
  late TextEditingController _encomiendistaCtrl;
  late TextEditingController _precioProductoCtrl;
  late TextEditingController _costoEnvioCtrl;
  late TextEditingController _totalCtrl;
  late TextEditingController _descripcionCtrl;
  late TextEditingController _notasCtrl;

  int? _puntoDestinoId;
  bool _initialized = false;
  bool _camposModificados = false;

  @override
  void initState() {
    super.initState();
    _vendedorCtrl = TextEditingController();
    _clienteCtrl = TextEditingController();
    _telefonoCtrl = TextEditingController();
    _diaEntregaCtrl = TextEditingController();
    _destinoCtrl = TextEditingController();
    _encomiendistaCtrl = TextEditingController();
    _precioProductoCtrl = TextEditingController();
    _costoEnvioCtrl = TextEditingController();
    _totalCtrl = TextEditingController();
    _descripcionCtrl = TextEditingController();
    _notasCtrl = TextEditingController();
  }

  void _initControllers(RecepcionPaquete recepcion) {
    if (_initialized) return;

    _vendedorCtrl.text = recepcion.vendedor ?? '';
    _clienteCtrl.text = recepcion.cliente ?? '';
    _telefonoCtrl.text = recepcion.telefono ?? '';
    _diaEntregaCtrl.text = recepcion.diaEntrega ?? '';
    _destinoCtrl.text = recepcion.destino ?? '';
    _encomiendistaCtrl.text = recepcion.encomendista ?? '';
    _precioProductoCtrl.text =
        recepcion.precioProducto?.toStringAsFixed(2) ?? '';
    _costoEnvioCtrl.text = recepcion.costoEnvio?.toStringAsFixed(2) ?? '';
    _totalCtrl.text = recepcion.total?.toStringAsFixed(2) ?? '';
    _initialized = true;
  }

  @override
  void dispose() {
    _vendedorCtrl.dispose();
    _clienteCtrl.dispose();
    _telefonoCtrl.dispose();
    _diaEntregaCtrl.dispose();
    _destinoCtrl.dispose();
    _encomiendistaCtrl.dispose();
    _precioProductoCtrl.dispose();
    _costoEnvioCtrl.dispose();
    _totalCtrl.dispose();
    _descripcionCtrl.dispose();
    _notasCtrl.dispose();
    super.dispose();
  }

  Future<void> _guardarCambios(RecepcionPaquete recepcion) async {
    final cambios = <String, dynamic>{};

    if (_vendedorCtrl.text.trim() != (recepcion.vendedor ?? '')) {
      cambios['vendedor'] = _vendedorCtrl.text.trim();
    }
    if (_clienteCtrl.text.trim() != (recepcion.cliente ?? '')) {
      cambios['cliente'] = _clienteCtrl.text.trim();
    }
    if (_telefonoCtrl.text.trim() != (recepcion.telefono ?? '')) {
      cambios['telefono'] = _telefonoCtrl.text.trim();
    }
    if (_diaEntregaCtrl.text.trim() != (recepcion.diaEntrega ?? '')) {
      cambios['dia_entrega'] = _diaEntregaCtrl.text.trim();
    }
    if (_destinoCtrl.text.trim() != (recepcion.destino ?? '')) {
      cambios['destino'] = _destinoCtrl.text.trim();
    }
    if (_encomiendistaCtrl.text.trim() != (recepcion.encomendista ?? '')) {
      cambios['encomendista'] = _encomiendistaCtrl.text.trim();
    }

    final precioProducto = double.tryParse(_precioProductoCtrl.text);
    if (precioProducto != recepcion.precioProducto) {
      cambios['precio_producto'] = precioProducto;
    }

    final costoEnvio = double.tryParse(_costoEnvioCtrl.text);
    if (costoEnvio != recepcion.costoEnvio) {
      cambios['costo_envio'] = costoEnvio;
    }

    final total = double.tryParse(_totalCtrl.text);
    if (total != recepcion.total) {
      cambios['total'] = total;
    }

    if (cambios.isNotEmpty) {
      await ref.read(recepcionProvider.notifier).actualizarRecepcion(cambios);
      setState(() => _camposModificados = false);
    }
  }

  Future<void> _convertirAPaquete() async {
    if (!_formKey.currentState!.validate()) return;

    if (_puntoDestinoId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debe seleccionar el punto de destino'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    await ref
        .read(recepcionProvider.notifier)
        .convertirAPaquete(
          puntoDestinoId: _puntoDestinoId!,
          descripcion: _descripcionCtrl.text.trim().isEmpty
              ? null
              : _descripcionCtrl.text.trim(),
          notas: _notasCtrl.text.trim().isEmpty ? null : _notasCtrl.text.trim(),
          remitenteNombre: _vendedorCtrl.text.trim(),
          remitenteTelefono: null,
          destinatarioNombre: _clienteCtrl.text.trim(),
          destinatarioTelefono: _telefonoCtrl.text.trim(),
          costoEnvio: double.tryParse(_costoEnvioCtrl.text),
          valorPaquete: double.tryParse(_precioProductoCtrl.text),
        );
  }

  Future<void> _descartarRecepcion() async {
    final motivo = await showDialog<String>(
      context: context,
      builder: (context) => _DescartarDialog(),
    );

    if (motivo != null && motivo.isNotEmpty) {
      await ref.read(recepcionProvider.notifier).descartarRecepcion(motivo);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(recepcionProvider);

    // Inicializar controllers con datos de la recepcion
    final recepcion = state.recepcion;
    if (recepcion != null) {
      _initControllers(recepcion);
    }

    // Escuchar cambios de estado
    ref.listen<RecepcionState>(recepcionProvider, (previous, next) {
      next.maybeWhen(
        paqueteCreado: (paquete) {
          context.go('/recepcion/confirmacion');
        },
        initial: () {
          context.go('/recepcion/captura');
        },
        error: (mensaje, _, _, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(mensaje), backgroundColor: AppColors.error),
          );
        },
        orElse: () {},
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Validar Datos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ref.read(recepcionProvider.notifier).reiniciar();
            context.go('/recepcion/captura');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: _descartarRecepcion,
            tooltip: 'Descartar',
          ),
        ],
      ),
      body: state.maybeWhen(
        validandoDatos: (recepcion, imagenPath, puntos) =>
            _buildForm(recepcion, imagenPath, puntos),
        guardandoCambios: (recepcion, imagenPath, puntos) => Stack(
          children: [
            _buildForm(recepcion, imagenPath, puntos),
            Container(
              color: Colors.black26,
              child: const Center(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text('Guardando cambios...'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        convirtiendoPaquete: (_, _) => const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Creando paquete...'),
            ],
          ),
        ),
        orElse: () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Estado no valido'),
              const SizedBox(height: 16),
              CustomButton(
                text: 'Volver a capturar',
                onPressed: () {
                  ref.read(recepcionProvider.notifier).reiniciar();
                  context.go('/recepcion/captura');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm(
    RecepcionPaquete recepcion,
    String imagenPath,
    List<Punto> puntos,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Imagen de la vineta
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                File(imagenPath),
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => Container(
                  height: 150,
                  color: Colors.grey[200],
                  child: const Icon(Icons.image_not_supported, size: 48),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Indicador de confianza global
            OcrConfidenceIndicator(
              confianza: recepcion.confianzaGlobal,
              textoCrudo: '',
            ),
            const SizedBox(height: 24),

            // Seccion Vendedor/Remitente
            _buildSectionTitle('Vendedor (Remitente)'),
            const SizedBox(height: 8),
            CampoEditable(
              label: 'Vendedor',
              controller: _vendedorCtrl,
              confianza: recepcion.getConfianzaCampo('vendedor'),
              onChanged: (_) => setState(() => _camposModificados = true),
            ),
            const SizedBox(height: 24),

            // Seccion Cliente/Destinatario
            _buildSectionTitle('Cliente (Destinatario)'),
            const SizedBox(height: 8),
            CampoEditable(
              label: 'Nombre del cliente',
              controller: _clienteCtrl,
              confianza: recepcion.getConfianzaCampo('cliente'),
              onChanged: (_) => setState(() => _camposModificados = true),
            ),
            const SizedBox(height: 12),
            CampoEditable(
              label: 'Telefono WhatsApp',
              controller: _telefonoCtrl,
              confianza: recepcion.getConfianzaCampo('telefono'),
              keyboardType: TextInputType.phone,
              onChanged: (_) => setState(() => _camposModificados = true),
            ),
            const SizedBox(height: 24),

            // Seccion Entrega
            _buildSectionTitle('Entrega'),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: CampoEditable(
                    label: 'Dia de entrega',
                    controller: _diaEntregaCtrl,
                    confianza: recepcion.getConfianzaCampo('dia_entrega'),
                    onChanged: (_) => setState(() => _camposModificados = true),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CampoEditable(
                    label: 'Destino',
                    controller: _destinoCtrl,
                    confianza: recepcion.getConfianzaCampo('destino'),
                    onChanged: (_) => setState(() => _camposModificados = true),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            CampoEditable(
              label: 'Encomendista',
              controller: _encomiendistaCtrl,
              confianza: recepcion.getConfianzaCampo('encomendista'),
              onChanged: (_) => setState(() => _camposModificados = true),
            ),
            const SizedBox(height: 24),

            // Seccion Valores
            _buildSectionTitle('Valores'),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: CampoEditable(
                    label: 'Precio producto',
                    controller: _precioProductoCtrl,
                    confianza: recepcion.getConfianzaCampo('precio_producto'),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    prefijo: '\$ ',
                    onChanged: (_) => setState(() => _camposModificados = true),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CampoEditable(
                    label: 'Costo envio',
                    controller: _costoEnvioCtrl,
                    confianza: recepcion.getConfianzaCampo('costo_envio'),
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    prefijo: '\$ ',
                    onChanged: (_) => setState(() => _camposModificados = true),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            CampoEditable(
              label: 'Total a pagar',
              controller: _totalCtrl,
              confianza: recepcion.getConfianzaCampo('total'),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              prefijo: '\$ ',
              onChanged: (_) => setState(() => _camposModificados = true),
            ),
            const SizedBox(height: 24),

            // Boton guardar cambios (si hay modificaciones)
            if (_camposModificados) ...[
              OutlinedButton.icon(
                onPressed: () => _guardarCambios(recepcion),
                icon: const Icon(Icons.save_outlined),
                label: const Text('Guardar cambios'),
              ),
              const SizedBox(height: 24),
            ],

            // Seccion Punto Destino
            _buildSectionTitle('Punto de Destino'),
            const SizedBox(height: 8),
            DropdownButtonFormField<int>(
              initialValue: _puntoDestinoId,
              decoration: InputDecoration(
                labelText: 'Seleccionar destino',
                prefixIcon: const Icon(Icons.flag_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              items: puntos
                  .where((p) => p.id != recepcion.puntoServicio.id)
                  .map(
                    (p) => DropdownMenuItem(
                      value: p.id,
                      child: Text('${p.nombre} (${p.codigo})'),
                    ),
                  )
                  .toList(),
              onChanged: (v) => setState(() => _puntoDestinoId = v),
              validator: (v) => v == null ? 'Seleccione el destino' : null,
            ),
            const SizedBox(height: 24),

            // Seccion Descripcion (opcional)
            _buildSectionTitle('Descripcion (opcional)'),
            const SizedBox(height: 8),
            CampoEditable(
              label: 'Contenido del paquete',
              controller: _descripcionCtrl,
              maxLines: 2,
            ),
            const SizedBox(height: 12),
            CampoEditable(
              label: 'Notas adicionales',
              controller: _notasCtrl,
              maxLines: 2,
            ),
            const SizedBox(height: 32),

            // Boton convertir a paquete
            CustomButton(
              text: 'Crear Paquete',
              icon: Icons.inventory_2,
              onPressed: _convertirAPaquete,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
    );
  }
}

class _DescartarDialog extends StatefulWidget {
  @override
  State<_DescartarDialog> createState() => _DescartarDialogState();
}

class _DescartarDialogState extends State<_DescartarDialog> {
  final _motivoCtrl = TextEditingController();

  @override
  void dispose() {
    _motivoCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Descartar Recepcion'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Esta accion no se puede deshacer.'),
          const SizedBox(height: 16),
          TextField(
            controller: _motivoCtrl,
            decoration: const InputDecoration(
              labelText: 'Motivo del descarte',
              hintText: 'Ej: Imagen ilegible',
              border: OutlineInputBorder(),
            ),
            maxLines: 2,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            if (_motivoCtrl.text.trim().isNotEmpty) {
              Navigator.of(context).pop(_motivoCtrl.text.trim());
            }
          },
          style: TextButton.styleFrom(foregroundColor: AppColors.error),
          child: const Text('Descartar'),
        ),
      ],
    );
  }
}
