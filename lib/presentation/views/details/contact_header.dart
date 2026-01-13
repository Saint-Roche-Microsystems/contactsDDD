import 'package:flutter/material.dart';

import '../../widgets/profile_picture.dart';
import '../../../domain/entities/contacto.dart';

class ContactHeader extends StatelessWidget {
  final Contacto contacto;
  const ContactHeader({super.key, required this.contacto});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
              color: Colors.black,
              shadows: [
                Shadow(
                  blurRadius: 4,
                  color: Colors.black26,
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
