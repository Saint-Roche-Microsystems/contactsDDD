import 'dart:io';
import 'package:flutter/material.dart';

import '../../domain/entities/contacto.dart';

class ProfilePicture extends StatelessWidget {
  final Contacto contact;
  final double radius;
  final double fontSize;

  const ProfilePicture({
    super.key,
    required this.contact,
    required this.radius,
    required this.fontSize
  });

  @override
  Widget build(BuildContext context) {
    if(contact.foto.isNotEmpty && File(contact.foto).existsSync()) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: FileImage(File(contact.foto)),
        backgroundColor: Colors.grey[200],
      );
    } else {
      return CircleAvatar(
        radius: radius,
        child: Text(
          contact.iniciales,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        )
      );
    }
  }
}
