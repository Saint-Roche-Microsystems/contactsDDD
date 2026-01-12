import 'dart:io';
import 'package:contactos/presentation/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/contacto.dart';

class ContactHeader extends StatelessWidget {
  final Contacto contacto;
  const ContactHeader({super.key, required this.contacto});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: contacto.esFavorito
              ? [Colors.amber.shade300, Colors.amber.shade100]
              : [Colors.blue.shade300, Colors.blue.shade100],
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          ProfilePicture(contact: contacto, radius: 60, fontSize: 50,),
          SizedBox(height: 16),
          Text(
            contacto.nombre,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  blurRadius: 4,
                  color: Colors.black26,
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          if (contacto.esFavorito) ...[
            SizedBox(height: 8),
            _buildFavoritoBadge(),
          ],
        ],
      ),
    );
  }

  Widget _buildFavoritoBadge() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: Colors.blue, size: 16),
          SizedBox(width: 4),
          Text(
            'Favorito',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade800,
            ),
          ),
        ],
      ),
    );
  }
}
