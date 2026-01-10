class Contacto {
  final int? id;
  final String nombre;
  final String descripcion;
  final String foto;

  Contacto({
    this.id,
    required this.nombre,
    required this.descripcion,
    required this.foto,
  });

  Contacto.fromMap(Map<String, dynamic> map)
      : id = map['id'] as int?,
        nombre = map['nombre'] as String,
        descripcion = map['descripcion'] as String,
        foto = map['foto'] as String;
}