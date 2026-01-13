import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/contacto.dart';
import '../presentation/providers/contacto_provider.dart';

class ContactoController {
  final WidgetRef ref;
  final BuildContext context;

  ContactoController({
    required this.ref,
    required this.context,
  });

  /// Agregar un nuevo contacto
  Future<bool> agregarContacto(Contacto contacto) async {
    try {
      await ref.read(contactoProvider.notifier).agregar(contacto);

      _mostrarMensajeExito('Contacto agregado exitosamente');
      return true;
    } catch (e) {
      _mostrarMensajeError('Error al agregar contacto: $e');
      return false;
    }
  }

  /// Actualizar un contacto existente
  Future<bool> actualizarContacto(Contacto contacto) async {
    try {
      await ref.read(contactoProvider.notifier).actualizar(contacto);
      return true;
    } catch (e) {
      _mostrarMensajeError('Error al actualizar contacto: $e');
      return false;
    }
  }

  /// Eliminar un contacto
  Future<bool> eliminarContacto(int id) async {
    try {
      await ref.read(contactoProvider.notifier).eliminar(id);

      _mostrarMensajeExito('Contacto eliminado');
      return true;
    } catch (e) {
      _mostrarMensajeError('Error al eliminar contacto: $e');
      return false;
    }
  }

  /// Marcar/desmarcar como favorito
  Future<bool> toggleFavorito(int id, bool esFavorito) async {
    try {
      await ref.read(contactoProvider.notifier).cambiarFavorito(id, esFavorito);
      await ref.read(favoritosProvider.notifier).cargar();
      return true;
    } catch (e) {
      _mostrarMensajeError('Error al actualizar favorito: $e');
      return false;
    }
  }

  /// Recargar la lista de contactos
  Future<void> recargarContactos() async {
    await ref.read(contactoProvider.notifier).cargar();
  }

  /// Recargar la lista de favoritos
  Future<void> recargarFavoritos() async {
    await ref.read(favoritosProvider.notifier).cargar();
  }

  // ============================================
  // MÉTODOS PRIVADOS PARA MENSAJES
  // ============================================

  /// Mostrar mensaje de éxito
  void _mostrarMensajeExito(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                mensaje,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }

  /// Mostrar mensaje de error
  void _mostrarMensajeError(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.error, color: Colors.white),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                mensaje,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        duration: Duration(seconds: 4),
      ),
    );
  }
}