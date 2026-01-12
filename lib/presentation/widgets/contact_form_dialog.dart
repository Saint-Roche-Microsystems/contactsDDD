import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../domain/entities/contacto.dart';

class ContactFormDialog extends StatefulWidget {
  const ContactFormDialog({super.key});

  @override
  State<ContactFormDialog> createState() => _ContactFormDialogState();
}

class _ContactFormDialogState extends State<ContactFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nombreCtrl = TextEditingController();
  final _correoCtrl = TextEditingController();
  final _telefonoCtrl = TextEditingController();
  final _descripcionCtrl = TextEditingController();

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
      title: Text('Nuevo Contacto'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              // NOMBRE
              TextFormField(
                controller: _nombreCtrl,
                decoration: InputDecoration(
                  labelText: 'Nombre *',
                  hintText: 'Ingresa el nombre completo',
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
                autofocus: true,
              ),
              SizedBox(height: 16),

              // CORREO
              TextFormField(
                controller: _correoCtrl,
                decoration: InputDecoration(
                  labelText: 'Correo electrónico *',
                  hintText: 'ejemplo@correo.com',
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
                    return 'Correo inválido (ej: usuario@dominio.com)';
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
                  hintText: '0999999999',
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
                  hintText: 'Información adicional (opcional)',
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
              SizedBox(height: 8),
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

        //GUARDAR
        ElevatedButton.icon(
          onPressed: _crearContacto,
          label: Text('Guardar'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
      ],
    );
  }

  void _crearContacto() {
    if (!_formKey.currentState!.validate()) return;

    final nuevoContacto = Contacto(
      nombre: _nombreCtrl.text.trim(),
      correo: _correoCtrl.text.trim(),
      telefono: _telefonoCtrl.text.trim(),
      descripcion: _descripcionCtrl.text.trim(),
      foto: '',
      esFavorito: false,
    );

    Navigator.pop(context, nuevoContacto);
  }
}