import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  @override
  void initState() {
    super.initState();
    _nombreCtrl = TextEditingController(text: widget.contacto.nombre);
    _correoCtrl = TextEditingController(text: widget.contacto.correo);
    _telefonoCtrl = TextEditingController(text: widget.contacto.telefono);
    _descripcionCtrl = TextEditingController(text: widget.contacto.descripcion);
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
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
        ),
      ],
    );
  }

  void _guardarCambios() {
    if (!_formKey.currentState!.validate()) return;

    final contactoEditado = widget.contacto.copyWith(
      nombre: _nombreCtrl.text.trim(),
      correo: _correoCtrl.text.trim(),
      telefono: _telefonoCtrl.text.trim(),
      descripcion: _descripcionCtrl.text.trim(),
    );

    Navigator.pop(context, contactoEditado);
  }
}
