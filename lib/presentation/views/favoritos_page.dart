import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/contact_item.dart';
import '../providers/contacto_provider.dart';

class FavoritosPage extends ConsumerWidget {
  const FavoritosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritos = ref.watch(favoritosProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Favoritos')),
      body: favoritos.when(
          data: (favoritos) {
            if (favoritos.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star_outline, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(
                      'No hay favoritos',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Marca contactos como favoritos\npara verlos aquí',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 8),
              itemCount: favoritos.length,
              itemBuilder: (_, index) {
                final contacto = favoritos[index];
                return ContactItem(
                  contacto: contacto,
                );
              },
            );
          },
          error: (e, _) => Text(e.toString()),
          loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}