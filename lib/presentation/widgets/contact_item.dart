import 'package:flutter/material.dart';

import '../../domain/entities/contacto.dart';

import '../views/detalle_contacto_page.dart';

import 'profile_picture.dart';

class ContactItem extends StatelessWidget {
  final Contacto contacto;
  final bool mostrarFavorito;

  const ContactItem({
    super.key,
    required this.contacto,
    this.mostrarFavorito = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: ProfilePicture(contact: contacto, radius: 28, fontSize: 18, ),
        title: Text(
          contacto.nombre,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetalleContactoPage(contacto: contacto),
            ),
          );
        },
      ),
    );
  }
}