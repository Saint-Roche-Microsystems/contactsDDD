import 'dart:io';
import 'package:contactos/themes/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import '../../domain/entities/contacto.dart';

class ContactEditDialog extends StatefulWidget {
  final Contacto contacto;

  const ContactEditDialog({super.key, required this.contacto});

  @override
  State<ContactEditDialog> createState() => _ContactEditDialogState();
}

class _ContactEditDialogState extends State<ContactEditDialog> {
  late TextEditingController _nombreCtrl;
  late TextEditingController _correoCtrl;
  late TextEditingController _telefonoCtrl;
  late TextEditingController _descripcionCtrl;
  final _formKey = GlobalKey<FormState>();

  String? _fotoPath;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _nombreCtrl = TextEditingController(text: widget.contacto.nombre);
    _correoCtrl = TextEditingController(text: widget.contacto.correo);
    _telefonoCtrl = TextEditingController(text: widget.contacto.telefono);
    _descripcionCtrl = TextEditingController(text: widget.contacto.descripcion);
    _fotoPath = widget.contacto.foto.isNotEmpty ? widget.contacto.foto : null;
  }

  @override
  void dispose() {
    _nombreCtrl.dispose();
    _correoCtrl.dispose();
    _telefonoCtrl.dispose();
    _descripcionCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Editar Contacto'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // FOTO
              _buildFotoSelector(),
              SizedBox(height: 20),

              // NOMBRE
              TextFormField(
                controller: _nombreCtrl,
                decoration: InputDecoration(
                  labelText: 'Nombre *',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: Icon(Icons.person),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'El nombre es obligatorio';
                  }
                  if (value.trim().length < 2) {
                    return 'El nombre debe tener al menos 2 caracteres';
                  }
                  return null;
                },
                textCapitalization: TextCapitalization.words,
              ),
              SizedBox(height: 16),

              // CORREO
              TextFormField(
                controller: _correoCtrl,
                decoration: InputDecoration(
                  labelText: 'Correo *',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: Icon(Icons.email),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'El correo es obligatorio';
                  }
                  if (!Contacto.validarCorreo(value.trim())) {
                    return 'Correo inválido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // TELÉFONO
              TextFormField(
                controller: _telefonoCtrl,
                decoration: InputDecoration(
                  labelText: 'Teléfono *',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: Icon(Icons.phone),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'El teléfono es obligatorio';
                  }
                  if (value.trim().length < 7) {
                    return 'El teléfono debe tener al menos 7 dígitos';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // DESCRIPCIÓN
              TextFormField(
                controller: _descripcionCtrl,
                decoration: InputDecoration(
                  labelText: 'Descripción',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: Icon(Icons.description),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  alignLabelWithHint: true,
                ),
                maxLines: 3,
                maxLength: 200,
                textCapitalization: TextCapitalization.sentences,
              ),
            ],
          ),
        ),
      ),

      actions: [
        // CANCELAR
        TextButton(
          onPressed: () => Navigator.pop(context),
          style: TextButton.styleFrom(
            foregroundColor: Colors.grey,
          ),
          child: Text('Cancelar'),
        ),

        // GUARDAR
        ElevatedButton.icon(
          onPressed: _guardarCambios,
          label: Text('Guardar'),
        ),
      ],
    );
  }

  Widget _buildFotoSelector() {
    return Column(
      children: [
        // Avatar con la foto actual o placeholder
        GestureDetector(
          onTap: _mostrarOpcionesFoto,
          child: Stack(
            children: [
              // Avatar
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: _fotoPath != null && File(_fotoPath!).existsSync()
                    ? FileImage(File(_fotoPath!))
                    : null,
                child: _fotoPath == null || !File(_fotoPath!).existsSync()
                    ? Icon(Icons.person, size: 50, color: Colors.grey.shade400)
                    : null,
              ),
              // Botón de editar en la esquina
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: SaintColors.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        // Texto indicativo
        Text(
          'Toca para cambiar la foto',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
        // Botón para eliminar foto (si existe)
        if (_fotoPath != null && _fotoPath!.isNotEmpty)
          TextButton.icon(
            onPressed: () {
              setState(() {
                _fotoPath = '';
              });
            },
            icon: Icon(Icons.delete_outline, size: 16),
            label: Text('Eliminar foto'),
            style: TextButton.styleFrom(
              foregroundColor: SaintColors.error,
            ),
          ),
      ],
    );
  }

  Future<void> _mostrarOpcionesFoto() async {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Título
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Seleccionar foto',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              // Opción: Cámara
              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.camera_alt, color: SaintColors.primary),
                ),
                title: Text('Tomar foto'),
                subtitle: Text('Usar la cámara'),
                onTap: () {
                  Navigator.pop(context);
                  _seleccionarFoto(ImageSource.camera);
                },
              ),
              // Opción: Galería
              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.photo_library, color: SaintColors.success),
                ),
                title: Text('Elegir de galería'),
                subtitle: Text('Seleccionar una foto existente'),
                onTap: () {
                  Navigator.pop(context);
                  _seleccionarFoto(ImageSource.gallery);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _seleccionarFoto(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (image != null) {
        // Guardar la foto en el directorio de la app
        final String savedPath = await _guardarFoto(image);

        setState(() {
          _fotoPath = savedPath;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al seleccionar foto: $e')),
      );
    }
  }

  Future<String> _guardarFoto(XFile image) async {
    // Obtener directorio de la app
    final Directory appDir = await getApplicationDocumentsDirectory();
    final String fotosDir = path.join(appDir.path, 'fotos_contactos');

    // Crear directorio si no existe
    await Directory(fotosDir).create(recursive: true);

    // Generar nombre único para la foto
    final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final String extension = path.extension(image.path);
    final String nuevoPath = path.join(fotosDir, 'contacto_$timestamp$extension');

    // Copiar la foto al nuevo path
    await File(image.path).copy(nuevoPath);

    return nuevoPath;
  }

  void _guardarCambios() {
    if (!_formKey.currentState!.validate()) return;

    final contactoEditado = widget.contacto.copyWith(
      nombre: _nombreCtrl.text.trim(),
      correo: _correoCtrl.text.trim(),
      telefono: _telefonoCtrl.text.trim(),
      descripcion: _descripcionCtrl.text.trim(),
      foto: _fotoPath ?? '',
    );

    Navigator.pop(context, contactoEditado);
  }
}
