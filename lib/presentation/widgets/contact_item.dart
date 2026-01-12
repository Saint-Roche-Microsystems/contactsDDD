import 'dart:io';
import 'package:contactos/presentation/views/detalle_contacto_page.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/contacto.dart';

class ContactItem extends StatelessWidget {
  final Contacto contacto;
  final bool mostrarFavorito;

  const ContactItem({
    Key? key,
    required this.contacto,
    this.mostrarFavorito = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        // Avatar con imagen o inicial
        leading: _buildAvatar(),
        // Nombre del contacto
        title: Text(
          contacto.nombre,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        // Correo del contacto
        subtitle: Padding(
          padding: EdgeInsets.only(top: 4),
          child: Row(
            children: [
              Icon(Icons.email, size: 14, color: Colors.grey[600]),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  contacto.correo,
                  style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        // Icono de favorito (opcional)
        trailing: mostrarFavorito && contacto.esFavorito
            ? Icon(Icons.star, color: Colors.amber, size: 24)
            : Icon(Icons.chevron_right, color: Colors.grey[400]),
        // Navegar a detalle al hacer tap
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

  Widget _buildAvatar() {
    if (contacto.foto.isNotEmpty && File(contacto.foto).existsSync()) {
      return CircleAvatar(
        radius: 28,
        backgroundImage: FileImage(File(contacto.foto)),
        backgroundColor: Colors.grey[200],
      );
    } else {
      return CircleAvatar(
        radius: 28,
        backgroundColor: contacto.esFavorito ? Colors.amber[100] : Colors.blue[100],
        child: CircleAvatar(child: Icon(Icons.person)),
      );
    }
  }
}