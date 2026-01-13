import 'package:flutter/material.dart';
import '../../../domain/entities/contacto.dart';

class ContactInfoSection extends StatelessWidget {
  final Contacto contacto;
  const ContactInfoSection({super.key, required this.contacto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // TELEFONO
          _InfoCard(
            icon: Icons.phone,
            value: contacto.telefonoFormateado,
            color: Colors.green,
          ),
          SizedBox(height: 16),

          // CORREO
          _InfoCard(
            icon: Icons.email,
            value: contacto.correo,
            color: Colors.blue,
          ),
          SizedBox(height: 16),

          // DESCRIPCIÓN
          if (contacto.descripcion.isNotEmpty)
            _InfoCard(
              icon: Icons.description,
              value: contacto.descripcion,
              color: Colors.orange,
            ),
          SizedBox(height: 80),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final Color color;

  const _InfoCard({
    required this.icon,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              padding: EdgeInsets.all(10),
              child: Icon(icon, color: color, size: 24),
            ),
            SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
