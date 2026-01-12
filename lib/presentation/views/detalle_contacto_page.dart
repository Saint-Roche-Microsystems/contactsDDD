import 'dart:io';
import 'package:contactos/presentation/views/details/contact_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/contacto.dart';
import '../providers/contacto_provider.dart';

class DetalleContactoPage extends ConsumerStatefulWidget {
  final Contacto contacto;
  const DetalleContactoPage({super.key, required this.contacto});

  @override
  ConsumerState<DetalleContactoPage> createState() => _DetalleContactoPageState();
}

class _DetalleContactoPageState extends ConsumerState<DetalleContactoPage> {
  late Contacto _currentContact;

  @override
  void initState() {
    super.initState();
    _currentContact = widget.contacto;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ContactHeader(contacto: _currentContact),
            SizedBox(height: 24),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _mostrarFormularioEditar,
        icon: Icon(Icons.edit),
        label: Text('Editar'),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Detalles del Contacto'),
      actions: [
        IconButton(
          icon: Icon(
            _currentContact.esFavorito ? Icons.star : Icons.star_border,
            color: _currentContact.esFavorito ? Colors.blue : null,
          ),
          onPressed: _toggleFavorito,
          tooltip: _currentContact.esFavorito
              ? 'Quitar de favoritos'
              : 'Agregar a favoritos',
        ),
        IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: _mostrarDialogoEliminar,
          tooltip: 'Eliminar contacto',
        ),
      ],
    );
  }

  Future<void> _toggleFavorito() async {

  }

  Future<void> _mostrarFormularioEditar() async {

  }

  Future<void> _mostrarDialogoEliminar() async {

  }

}

