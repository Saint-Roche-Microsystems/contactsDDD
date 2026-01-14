import 'package:contactos/themes/color_schema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/contacto.dart';
import '../../controllers/contacto_controller.dart';

import '../widgets/contact_delete_dialog.dart';
import '../widgets/contact_edit_dialog.dart';

import 'details/contact_info_section.dart';
import 'details/contact_header.dart';

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
            ContactInfoSection(contacto: _currentContact),
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
            color: SaintColors.surface,
          ),
          onPressed: _toggleFavorito,
          tooltip: _currentContact.esFavorito
              ? 'Quitar de favoritos'
              : 'Agregar a favoritos',
        ),
        IconButton(
          icon: Icon(Icons.delete, color: SaintColors.error),
          onPressed: _mostrarDialogoEliminar,
          tooltip: 'Eliminar contacto',
        ),
      ],
    );
  }

  Future<void> _toggleFavorito() async {
    final controller = ContactoController(ref: ref, context: context);
    final cambiado = await controller.toggleFavorito(_currentContact.id!, !_currentContact.esFavorito);

    if(!cambiado) return;

    setState(() {
      _currentContact = _currentContact.copyWith(
          esFavorito: !_currentContact.esFavorito
      );
    });
  }

  Future<void> _mostrarFormularioEditar() async {
    final contactoEditado = await showDialog<Contacto>(
      context: context,
      builder: (context) => ContactEditDialog(contacto: _currentContact),
    );

    if(contactoEditado == null) return;

    final controller = ContactoController(ref: ref, context: context);
    final cambiado = await controller.actualizarContacto(contactoEditado);

    if(!cambiado) return;

    setState(() {
      _currentContact = contactoEditado;
    });
  }

  Future<void> _mostrarDialogoEliminar() async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (context) => ContactDeleteDialog(contacto: _currentContact),
    );

    if (confirmar == null || !confirmar) return;

    final controller = ContactoController(ref: ref, context: context);
    await controller.eliminarContacto(_currentContact.id!);

    Navigator.pop(context);
  }

}

