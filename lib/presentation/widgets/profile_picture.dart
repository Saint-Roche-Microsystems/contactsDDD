import 'dart:io';
import 'package:flutter/material.dart';

import '../../themes/color_schema.dart';
import '../../domain/entities/contacto.dart';

class ProfilePicture extends StatelessWidget {
  final Contacto contact;
  final double radius;
  final double fontSize;
  final double borderWidth;

  const ProfilePicture({
    super.key,
    required this.contact,
    required this.radius,
    required this.fontSize,
    this.borderWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(borderWidth),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: SaintColors.primary,
          width: borderWidth,
        ),
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: SaintColors.secondary.withValues(alpha: 0.4),
        backgroundImage: (contact.foto.isNotEmpty &&
            File(contact.foto).existsSync())
            ? FileImage(File(contact.foto))
            : null,
        child: (contact.foto.isEmpty ||
            !File(contact.foto).existsSync())
            ? Text(
          contact.iniciales,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        )
            : null,
      ),
    );
  }
}
