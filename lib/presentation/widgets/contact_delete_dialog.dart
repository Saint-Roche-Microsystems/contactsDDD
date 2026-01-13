import 'package:flutter/material.dart';
import '../../domain/entities/contacto.dart';

class ContactDeleteDialog extends StatelessWidget {
  final Contacto contacto;

  const ContactDeleteDialog({super.key, required this.contacto});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.warning, color: Colors.red),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Eliminar contacto',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '¿Estás seguro de que deseas eliminar a ${contacto.nombre}?',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 16),
        ],
      ),
      actions: [
        // CANCELAR
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text('Cancelar'),
          style: TextButton.styleFrom(
            foregroundColor: Colors.grey,
          ),
        ),

        // CONFIRMAR
        ElevatedButton.icon(
          onPressed: () => Navigator.pop(context, true),
          label: Text('Eliminar'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
