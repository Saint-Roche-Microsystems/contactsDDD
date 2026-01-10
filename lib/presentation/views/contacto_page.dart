import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/contacto_provider.dart';
import '../../domain/entities/contacto.dart';

class ContactosPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactos = ref.watch(contactoProvider);

    final TextEditingController nombreCtrl = TextEditingController();
    final TextEditingController descripcionCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Contactos')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text('Nuevo Contacto'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nombreCtrl,
                    decoration: InputDecoration(labelText: 'Nombre'),
                  ),
                  TextField(
                    controller: descripcionCtrl,
                    decoration: InputDecoration(labelText: 'Descripción'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancelar'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (nombreCtrl.text.isEmpty ||
                        descripcionCtrl.text.isEmpty) return;

                    await ref.read(contactoProvider.notifier).agregar(
                      Contacto(
                        nombre: nombreCtrl.text,
                        descripcion: descripcionCtrl.text,
                        foto: '',
                        correo: '',
                      ),
                    );

                    Navigator.pop(context);
                  },
                  child: Text('Guardar'),
                ),
              ],
            ),
          );
        },
      ),
      body: contactos.when(
        data: (list) => ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, i) => ListTile(
            leading: list[i].foto.isNotEmpty
                ? CircleAvatar(
              backgroundImage: FileImage(File(list[i].foto)),
            )
                : CircleAvatar(child: Icon(Icons.person)),
            title: Text(list[i].nombre),
            subtitle: Text(list[i].descripcion),
          ),
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, _) => Text(e.toString()),
      ),
    );
  }
}