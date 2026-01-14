import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/call_button.dart';
import '../../widgets/info_card.dart';
import '../../../themes/color_schema.dart';
import '../../../domain/entities/contacto.dart';

class ContactInfoSection extends StatelessWidget {
  final Contacto contacto;
  const ContactInfoSection({super.key, required this.contacto});

  Future<void> _llamar(String telefono) async {
    final Uri telUri = Uri(scheme: 'tel', path: telefono);
    if (await canLaunchUrl(telUri)) {
      await launchUrl(telUri);
    }
  }

  Future<void> _enviarEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              // TELEFONO
              CallButton(
                icon: Icons.phone,
                label: 'Llamar',
                color: SaintColors.success,
                onPressed: () => _llamar(contacto.telefono),
              ),
              SizedBox(width: 12),

              // CORREO
              CallButton(
                icon: Icons.email,
                label: 'Mensaje',
                color: SaintColors.primary,
                onPressed: () => _enviarEmail(contacto.correo),
              ),
            ],
          ),

          SizedBox(height: 16),

          // DESCRIPCIÓN
          if (contacto.descripcion.isNotEmpty)
            InfoCard(
              icon: Icons.description,
              value: contacto.descripcion,
              color: SaintColors.contrast,
            ),
          SizedBox(height: 80),
        ],
      ),
    );
  }
}
