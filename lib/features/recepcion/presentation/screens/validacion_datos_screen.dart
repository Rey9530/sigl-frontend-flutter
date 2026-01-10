import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/custom_text_field.dart';
import '../../domain/entities/punto.dart';
import '../providers/recepcion_provider.dart';
import '../providers/recepcion_state.dart';
import '../widgets/ocr_confidence_indicator.dart';

class ValidacionDatosScreen extends ConsumerStatefulWidget {
  const ValidacionDatosScreen({super.key});

  @override
  ConsumerState<ValidacionDatosScreen> createState() =>
      _ValidacionDatosScreenState();
}

class _ValidacionDatosScreenState extends ConsumerState<ValidacionDatosScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _remitenteNombreCtrl;
  late TextEditingController _remitenteTelefonoCtrl;
  late TextEditingController _remitenteDuiCtrl;
  late TextEditingController _destinatarioNombreCtrl;
  late TextEditingController _destinatarioTelefonoCtrl;
  late TextEditingController _costoEnvioCtrl;
  late TextEditingController _valorPaqueteCtrl;
  late TextEditingController _descripcionCtrl;
  late TextEditingController _notasCtrl;

  int? _puntoOrigenId;
  int? _puntoDestinoId;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _remitenteNombreCtrl = TextEditingController();
    _remitenteTelefonoCtrl = TextEditingController();
    _remitenteDuiCtrl = TextEditingController();
    _destinatarioNombreCtrl = TextEditingController();
    _destinatarioTelefonoCtrl = TextEditingController();
    _costoEnvioCtrl = TextEditingController(text: '0.00');
    _valorPaqueteCtrl = TextEditingController();
    _descripcionCtrl = TextEditingController();
    _notasCtrl = TextEditingController();
  }

  void _initControllers(RecepcionState state) {
    if (_initialized) return;

    state.maybeWhen(
      validandoDatos: (ocrResult, imagenPath, puntos) {
        _remitenteNombreCtrl.text = ocrResult.remitenteNombre ?? '';
        _remitenteTelefonoCtrl.text = ocrResult.remitenteTelefono ?? '';
        _destinatarioNombreCtrl.text = ocrResult.destinatarioNombre ?? '';
        _destinatarioTelefonoCtrl.text = ocrResult.destinatarioTelefono ?? '';
        _initialized = true;
      },
      orElse: () {},
    );
  }

  @override
  void dispose() {
    _remitenteNombreCtrl.dispose();
    _remitenteTelefonoCtrl.dispose();
    _remitenteDuiCtrl.dispose();
    _destinatarioNombreCtrl.dispose();
    _destinatarioTelefonoCtrl.dispose();
    _costoEnvioCtrl.dispose();
    _valorPaqueteCtrl.dispose();
    _descripcionCtrl.dispose();
    _notasCtrl.dispose();
    super.dispose();
  }

  Future<void> _guardarPaquete() async {
    if (!_formKey.currentState!.validate()) return;

    if (_puntoOrigenId == null || _puntoDestinoId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debe seleccionar origen y destino'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    if (_puntoOrigenId == _puntoDestinoId) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('El origen y destino no pueden ser iguales'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    await ref.read(recepcionProvider.notifier).crearPaquete(
          remitenteNombre: _remitenteNombreCtrl.text.trim(),
          remitenteTelefono: _remitenteTelefonoCtrl.text.trim(),
          remitenteDui: _remitenteDuiCtrl.text.trim().isEmpty
              ? null
              : _remitenteDuiCtrl.text.trim(),
          destinatarioNombre: _destinatarioNombreCtrl.text.trim(),
          destinatarioTelefono: _destinatarioTelefonoCtrl.text.trim(),
          puntoOrigenId: _puntoOrigenId!,
          puntoDestinoId: _puntoDestinoId!,
          costoEnvio: double.tryParse(_costoEnvioCtrl.text) ?? 0,
          valorPaquete: _valorPaqueteCtrl.text.isEmpty
              ? null
              : double.tryParse(_valorPaqueteCtrl.text),
          descripcion: _descripcionCtrl.text.trim().isEmpty
              ? null
              : _descripcionCtrl.text.trim(),
          notas:
              _notasCtrl.text.trim().isEmpty ? null : _notasCtrl.text.trim(),
        );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(recepcionProvider);

    // Inicializar controllers con datos del OCR
    _initControllers(state);

    // Escuchar cambios de estado
    ref.listen<RecepcionState>(recepcionProvider, (previous, next) {
      next.maybeWhen(
        paqueteCreado: (paquete) {
          context.go('/recepcion/confirmacion');
        },
        error: (mensaje, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(mensaje),
              backgroundColor: AppColors.error,
            ),
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
      ),
      body: state.maybeWhen(
        validandoDatos: (ocrResult, imagenPath, puntos) =>
            _buildForm(ocrResult.confianza, ocrResult.textoCrudo, puntos),
        guardandoPaquete: () => const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Guardando paquete...'),
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

  Widget _buildForm(int confianza, String textoCrudo, List<Punto> puntos) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Indicador de confianza OCR
            OcrConfidenceIndicator(
              confianza: confianza,
              textoCrudo: textoCrudo,
            ),
            const SizedBox(height: 24),

            // Seccion Remitente
            _buildSectionTitle('Remitente'),
            const SizedBox(height: 8),
            CustomTextField(
              controller: _remitenteNombreCtrl,
              label: 'Nombre completo',
              prefixIcon: Icons.person_outline,
              validator: (v) =>
                  v == null || v.isEmpty ? 'El nombre es requerido' : null,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              controller: _remitenteTelefonoCtrl,
              label: 'Telefono',
              prefixIcon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
              validator: (v) =>
                  v == null || v.isEmpty ? 'El telefono es requerido' : null,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              controller: _remitenteDuiCtrl,
              label: 'DUI (opcional)',
              prefixIcon: Icons.badge_outlined,
              hint: '00000000-0',
            ),
            const SizedBox(height: 24),

            // Seccion Destinatario
            _buildSectionTitle('Destinatario'),
            const SizedBox(height: 8),
            CustomTextField(
              controller: _destinatarioNombreCtrl,
              label: 'Nombre completo',
              prefixIcon: Icons.person_outline,
              validator: (v) =>
                  v == null || v.isEmpty ? 'El nombre es requerido' : null,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              controller: _destinatarioTelefonoCtrl,
              label: 'Telefono',
              prefixIcon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
              validator: (v) =>
                  v == null || v.isEmpty ? 'El telefono es requerido' : null,
            ),
            const SizedBox(height: 24),

            // Seccion Puntos
            _buildSectionTitle('Ubicaciones'),
            const SizedBox(height: 8),
            DropdownButtonFormField<int>(
              value: _puntoOrigenId,
              decoration: InputDecoration(
                labelText: 'Punto de Origen',
                prefixIcon: const Icon(Icons.location_on_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              items: puntos
                  .map((p) => DropdownMenuItem(
                        value: p.id,
                        child: Text('${p.nombre} (${p.codigo})'),
                      ))
                  .toList(),
              onChanged: (v) => setState(() => _puntoOrigenId = v),
              validator: (v) => v == null ? 'Seleccione el origen' : null,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<int>(
              value: _puntoDestinoId,
              decoration: InputDecoration(
                labelText: 'Punto de Destino',
                prefixIcon: const Icon(Icons.flag_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              items: puntos
                  .map((p) => DropdownMenuItem(
                        value: p.id,
                        child: Text('${p.nombre} (${p.codigo})'),
                      ))
                  .toList(),
              onChanged: (v) => setState(() => _puntoDestinoId = v),
              validator: (v) => v == null ? 'Seleccione el destino' : null,
            ),
            const SizedBox(height: 24),

            // Seccion Valores
            _buildSectionTitle('Valores'),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: _costoEnvioCtrl,
                    label: 'Costo Envio (\$)',
                    prefixIcon: Icons.attach_money,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Requerido';
                      if (double.tryParse(v) == null) return 'Numero invalido';
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextField(
                    controller: _valorPaqueteCtrl,
                    label: 'Valor Paquete (\$)',
                    prefixIcon: Icons.inventory_2_outlined,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    hint: 'Opcional',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Seccion Descripcion
            _buildSectionTitle('Descripcion (opcional)'),
            const SizedBox(height: 8),
            CustomTextField(
              controller: _descripcionCtrl,
              label: 'Contenido del paquete',
              prefixIcon: Icons.description_outlined,
              maxLines: 2,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              controller: _notasCtrl,
              label: 'Notas adicionales',
              prefixIcon: Icons.note_outlined,
              maxLines: 2,
              hint: 'Ej: Fragil, entregar en horario de oficina',
            ),
            const SizedBox(height: 32),

            // Boton guardar
            CustomButton(
              text: 'Guardar Paquete',
              icon: Icons.save,
              onPressed: _guardarPaquete,
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
