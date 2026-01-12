import 'dart:io';
import 'package:contactos/controllers/contacto_controller.dart';
import 'package:contactos/presentation/views/forms/add_contact_form.dart';
import 'package:contactos/presentation/views/main/empty_state_screen.dart';
import 'package:contactos/presentation/views/main/error_state_screen.dart';
import 'package:contactos/presentation/widgets/contact_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/contacto_provider.dart';
import '../../domain/entities/contacto.dart';

class ContactosPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactos = ref.watch(contactoProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Contactos')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _mostrarFormularioAgregar(context, ref),
        icon: Icon(Icons.person_add),
        label: Text('Nuevo'),
        tooltip: 'Agregar nuevo contacto',
      ),

      body: contactos.when(
        data: (contactos) {
          if(contactos.isEmpty) {
            return EmptyStateScreen();
          }

          return RefreshIndicator(
            onRefresh: () async {
              await ref.read(contactoProvider.notifier).cargar();
            },
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 8),
              itemCount: contactos.length,
              itemBuilder: (context, index) {
                final contacto = contactos[index];
                return ContactItem(contacto: contacto, mostrarFavorito: true,);
              }
            ),
          );
        },

        loading: () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text(
                'Cargando contactos...',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        error: (error, _) => ErrorStateScreen(error: error, ref: ref),
      ),
    );
  }

  Future<void> _mostrarFormularioAgregar(BuildContext context, WidgetRef ref) async {
    final nuevoContacto = await showDialog<Contacto>(
      context: context,
      builder: (context) => AddContactForm(),
    );

    if (nuevoContacto == null) return;

    final controller = ContactoController(ref: ref, context: context);
    await controller.agregarContacto(nuevoContacto);
  }
}